class BookmarksController < ApplicationController
	def index
		@bookmarks = Bookmark.all
	end

	def new
		@bookmark = Bookmark.new
	end

	def create
		bookmark = Bookmark.create(bookmark_tab_params)
		# ['one', 'two', 'three', 'four', 'two', 'one', 'seven', 'six', 'eight']
		unless bookmark.blank?
			t = Tag.where(:name => ['one', 'two', 'three', 'four', 'two', 'one', 'seven', 'six', 'eight'])
			bookmark.tags = params[:bookmark][:tags]
		end
	end

	def show
		@bookmark = Bookmark.find(params[:id])
		@tags = @bookmark.tags.pluck(:name)
	end

	private
		def bookmark_tab_params
			params.require(:bookmark).permit(:url, :title, :private, :tabs)
		end
end