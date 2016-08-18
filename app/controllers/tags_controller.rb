class TagsController < ApplicationController
	def index
		authorize Tag
		@page = params[:page] ? params[:page] : 1
		@per_page = Kaminari.config.default_per_page
		@tags = Tag.owned_by(current_user).page @page
	end

	def new
		authorize Tag
		@tag = Tag.new
	end

	def create
		authorize Tag
		Tag.create(tag_params)
		redirect_to tags_path
	end

	def edit
		@tag = Tag.friendly.find(params[:id])
		authorize @tag
	end

	def update
		tag = Tag.friendly.find(params[:id])
		authorize tag
		Tag.update(tag, tag_params)
		redirect_to tags_path
	end

	def destroy
		Tag.destroy(params[:id])
		redirect_to tags_path
	end

	def show
		@tag = Tag.friendly.find(params[:id])
		authorize @tag
	end

	def search
	end

	def search
		# lock it down for now
		authorize Tag
		# should move this functionality to run directly from the web server ahead of Rails (metal)
		# - needs to accept a second param, exclusion tags from the result (becasue they've been selected/applied already)
		@tags = Tag.where("name LIKE ?", "%#{params[:q]}%")
		respond_to do |format|
			# format.html {render :text => "search: #{params[:q]} => #{@tags.map(&:name)}", status: :ok}
			format.html {render :json => @tags, status: :ok}
			format.js {render :json => @tags, status: :ok}
		end
	end

	private
		def tag_params
			params.require(:tag).permit(:name)
		end
end