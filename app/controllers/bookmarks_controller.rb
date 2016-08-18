class BookmarksController < ApplicationController
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

		bookmark = Bookmark.create(bookmark_params.merge({user: current_user})) if bookmark_params["url"].present?
		if bookmark.present?
			new_tags = params[:bookmark][:tags].split(',').collect do |item|
				Tag.find_or_create_by(name: item)
			end
			bookmark.tags << new_tags
			bookmark.save
			redirect_to bookmark, notice: 'Bookmark was successfully created.'
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
		Bookmark.update(bookmark, bookmark_params.merge({user: current_user}))
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

	private
		def bookmark_params
			params.require(:bookmark).permit(:url, :title, :private, :tags)
		end
end