class SearchController < ApplicationController
	def index
	end

	def search
		# should move this functionality to run directly from the web server ahead of Rails (metal)
		# - needs to accept a second param, exclusion tags from the result (becasue they've been selected/applied already)
		@model_name = params[:type].try(:downcase)
		if params[:q].blank?
			@results = []
		else
			@results = 	case @model_name
									when 'tags'
										Tag.where("name LIKE ?", "%#{params[:q]}%").limit(10)
									when 'bookmarks'
										Bookmark.where("title LIKE ? OR url LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%").limit(10)
									else
										# default to bookmarks treatment
										Bookmark.where("title LIKE ? OR url LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%").limit(10)
									end
		end
	end

end