class BookmarksController < ApplicationController
	after_action :allow_iframe, only: :save

	def index
		authorize Bookmark

		@page = params[:page] ? params[:page] : 1
		unless params[:user].present?
			redirect_to user_bookmarks_path(user: current_user, page: @page)
			return
		end

		@per_page = Kaminari.config.default_per_page
		@bookmarks = Bookmark.owned_by(User.friendly.find(params[:user])).page @page
	end

	def new
		authorize Bookmark
		@bookmark = Bookmark.new
		@tags = []

		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		authorize Bookmark

		b_p = bookmark_params
		tags = b_p.delete(:tags)

		if b_p["url"].present?
			bookmark = Bookmark.create(b_p.merge({user: current_user}))
			if bookmark.present?
				tag_candidates = tags.split(',').uniq.keep_if {|x| x.present? }
				new_tags = tag_candidates.collect do |item|
					Tag.find_or_create_by(name: item.strip.downcase)
				end
				bookmark.tags << new_tags
				bookmark.save
				redirect_to bookmark, notice: 'Bookmark was successfully created.'
			else
				redirect_to :back, notice: 'Bookmark creation failed.'
			end
		else
			redirect_to :back, notice: 'Bookmark creation failed.'
		end
	end

	def show
		@bookmark = Bookmark.find(params[:id])
		authorize @bookmark
		@tags = @bookmark.tags
	end

	def edit
		@bookmark = Bookmark.find(params[:id])
		authorize @bookmark
		@tags = @bookmark.tags
	end

	def update
		bookmark = Bookmark.find(params[:id])
		authorize bookmark

		b_p = bookmark_params
		tags = b_p.delete(:tags)

		bookmark.update(b_p.merge({user: current_user}))
		new_tags = tags.split(',').uniq.collect do |item|
			Tag.find_or_create_by(name: item.strip.downcase)
		end
		bookmark.tags = new_tags

		redirect_to bookmark_path(bookmark)
	end

	def search
		# lock it down for now
		authorize Bookmark
		# should move this functionality to run directly from the web server ahead of Rails (metal)
		@bookmarks = Bookmark.where("title LIKE ? OR url LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%").limit(10)
		respond_to do |format|
			# format.html {render :text => "search: #{params[:q]} => #{@bookmarks.collect_concat {|b| [b.title, b.url]}}", status: :ok}
			format.html {render :json => @bookmarks, status: :ok}
			format.js {render :json => @bookmarks, status: :ok}
		end
	end

	def destroy
		Bookmark.destroy(params[:id])
		redirect_to bookmarks_path
	end

	def save
		if signed_out?
			puts "--- out ---"
			redirect_to "iframe#new", layout: false
		else
			@bookmark = params.to_json
			render :save, layout: 'iframe'
		end
	end

	private
		def bookmark_params
			params.require(:bookmark).permit(:url, :title, :private, :tags, :comment)
		end

	  def allow_iframe
	    response.headers.except! 'X-Frame-Options'
	    puts "----------- bookmark - allow_iframe -------------------"
	  end
end