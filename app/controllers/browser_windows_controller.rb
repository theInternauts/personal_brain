class BrowserWindowsController < ApplicationController
	def index
		authorize BrowserWindow
		@browser_windows = BrowserWindow.all
	end

	def show
		@browser_window = BrowserWindow.find(params[:id])
		authorize @browser_window
	end

	def new
		authorize BrowserWindow
		@browser_window = BrowserWindow.new
		@browser_windows = BrowserWindow.all.group_by(&:device)
	end

	def create
		authorize BrowserWindow
		new_window = BrowserWindow.create(browser_window_params)
		Device.find(params[:device_id]).browser_windows << new_window
		redirect_to device_browser_window_path(new_window.device_id, new_window)
	end

	def update
		browser_window = BrowserWindow.find(params[:id])
		authorize browser_window
		browser_window.update!(browser_window_params)
		redirect_to device_browser_window_path(browser_window.device_id, browser_window)
	end

	def edit
		@browser_window = BrowserWindow.find(params[:id])
		authorize @browser_window
		@browser_windows = BrowserWindow.all
	end

	private
		def browser_window_params
      params.require(:browser_window).permit(:name, :private)
    end
end