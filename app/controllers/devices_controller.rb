class DevicesController < ApplicationController
	def index
		authorize Device
		@devices = current_user.devices
	end

	def show
		@device = Device.find(params[:id])
		authorize @device
	end

	def new
		authorize Device
		@device = Device.new
		@devices = current_user.devices
	end

	def create
		authorize Device
		device = Device.create(device_params.merge({user: current_user}))
		redirect_to device
	end

	def update
		device = Device.find(params[:id])
		authorize device
		device.update!(device_params.merge({user: current_user}))
		redirect_to device
	end

	def edit
		@device = Device.find(params[:id])
		authorize @device
		@devices = current_user.devices
	end

	private
		def device_params
      params.require(:device).permit(:name)
    end
end