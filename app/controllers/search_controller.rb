class SearchController < ApplicationController
	def index
	end

	def search
		# should move this functionality to run directly from the web server ahead of Rails (metal)
		# - needs to accept a second param, exclusion tags from the result (becasue they've been selected/applied already)
		@model_name = params[:type].downcase
		if params[:q].blank?
			@results = []
		else
			@results = 	case @model_name
									when 'tags'
										Tag.where("name LIKE ?", "%#{params[:q]}%")
									when 'bookmarks'
										@results = Bookmark.where("title LIKE ? OR url LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
									else
										# default to bookmarks treatment
										@results = Bookmark.where("title LIKE ? OR url LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
									end
		end
	end

end