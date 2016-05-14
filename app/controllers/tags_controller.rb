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

	private
		def tag_params
			params.require(:tag).permit(:name)
		end
end