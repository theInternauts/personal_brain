class DevicesController < ApplicationController
	def index
		@devices = Device.all
	end

	def show
		@device = Device.find(params[:id])
	end

	def new
		@device = Device.new
		@devices = Device.all
	end

	def create
		Device.create(device_params)
		redirect_to device
	end

	def update
		device = Device.find(params[:id])
		device.update!(device_params)
		redirect_to device
	end

	def edit
		@device = Device.find(params[:id])	
		@devices = Device.all	
	end

	private
		def device_params
      params.require(:device).permit(:name)
    end
end