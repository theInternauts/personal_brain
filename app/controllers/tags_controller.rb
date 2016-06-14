class TagsController < ApplicationController
	def index
		@tags = Tag.all
	end

	def new
		@tag = Tag.new		
	end

	def create
		Tag.create(tag_params)
		redirect_to tags_path
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def update
		tag = Tag.find(params[:id])
		Tag.update(tag, tag_params)
		redirect_to tags_path
	end

	def destroy
		Tag.destroy(params[:id])
		redirect_to tags_path
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def search
		# should move this functionality to run directly from the web server ahead of Rails (metal)
		# - needs to accept a second param, exclusion tags fromt he result (becasue they've been selected/applied already)
		@tags = Tag.where("name LIKE ?", "%#{params[:q]}%")
		respond_to do |format|
			format.html {render :text => "search: #{params[:q]} => #{@tags.map(&:name)}", status: :ok}
			format.js {render :json => @tags, status: :ok}
		end
	end

	private
		def tag_params
			params.require(:tag).permit(:name)
		end
end