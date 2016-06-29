class BookmarksController < ApplicationController
	def index
		@bookmarks = Bookmark.all
	end

	def new
		@bookmark = Bookmark.new
	end

	def create
		bookmark = Bookmark.create(bookmark_tab_params)
		unless bookmark.blank?
			new_tags = params[:bookmark][:tags].split(',').collect do |item|
				Tag.find_or_create_by(name: item)
			end
			bookmark.tags << new_tags
			bookmark.save
		end
	end

	def show
		@bookmark = Bookmark.find(params[:id])
		@tags = @bookmark.tags.sort
	end

	def search
		# should move this functionality to run directly from the web server ahead of Rails (metal)
		@bookmarks = Bookmark.where("title LIKE ? OR url LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
		respond_to do |format|
			format.html {render :text => "search: #{params[:q]} => #{@bookmarks.collect_concat {|b| [b.title, b.url]}}", status: :ok}
			format.js {render :json => @bookmarks, status: :ok}
		end
	end

	private
		def bookmark_tab_params
			params.require(:bookmark).permit(:url, :title, :private, :tabs)
		end
end