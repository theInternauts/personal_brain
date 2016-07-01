class BrowserWindowsController < ApplicationController
	def index
		@browser_windows = BrowserWindow.all
	end

	def show
		@browser_window = BrowserWindow.find(params[:id])
	end

	def new
		@browser_window = BrowserWindow.new
		@browser_windows = BrowserWindow.all.group_by(&:device)
	end

	def create
		new_window = BrowserWindow.create(browser_window_params)
		Device.find(params[:device_id]).browser_windows << new_window
		redirect_to device_browser_window_path(new_window.device_id, new_window)
	end

	def update
		browser_window = BrowserWindow.find(params[:id])
		browser_window.update!(browser_window_params)
		redirect_to device_browser_window_path(browser_window.device_id, browser_window)
	end

	def edit
		@browser_window = BrowserWindow.find(params[:id])
		@browser_windows = BrowserWindow.all
	end

	private
		def browser_window_params
      params.require(:browser_window).permit(:name, :private)
    end
end