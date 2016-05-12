class BrowserTabsController < ApplicationController
	def index
		@browser_tabs = BrowserTab.all
	end

	def show
		@browser_tab = BrowserTab.find(params[:id])
	end

	def new
		@browser_tab = BrowserTab.new
		@browser_tabs = BrowserWindow.find(params[:browser_window_id]).browser_tabs
	end

	def create
		new_tab = BrowserTab.create(browser_tab_params)
		window = BrowserWindow.find(params[:browser_window_id])
		window.browser_tabs << new_tab
		redirect_to device_browser_window_path(device_id: window.device_id, id: window)
	end

	def update
		browser_tab = BrowserTab.find(params[:id])
		BrowserTab.update!(browser_tab_params)
		redirect_to device_browser_tab_path(browser_tab.device_id, browser_tab)
	end

	def edit
		@browser_tab = BrowserTab.find(params[:id])	
		@browser_tabs = BrowserTab.all	
	end

	private
		def browser_tab_params
      params.require(:browser_tab).permit(:url, :title, :private)
    end
end