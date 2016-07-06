class DevicesController < ApplicationController
	def index
		@devices = current_user.devices
	end

	def show
		@device = Device.find(params[:id])
	end

	def new
		@device = Device.new
		@devices = current_user.devices
	end

	def create
		device = Device.create(device_params.merge({user: current_user}))
		redirect_to device
	end

	def update
		device = Device.find(params[:id])
		device.update!(device_params.merge({user: current_user}))
		redirect_to device
	end

	def edit
		@device = Device.find(params[:id])
		@devices = current_user.devices
	end

	private
		def device_params
      params.require(:device).permit(:name)
    end
end