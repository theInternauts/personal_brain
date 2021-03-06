class BrowserTabsController < ApplicationController
  def index
  	authorize BrowserTab
		@browser_tabs = BrowserTab.all
	end

	def show
		@browser_tab = BrowserTab.find(params[:id])
		authorize @browser_tab
	end

	def new
		authorize BrowserTab
		@browser_tab = BrowserTab.new
		@browser_tabs = BrowserWindow.find(params[:browser_window_id]).browser_tabs
	end

	def create
		authorize BrowserTab
		new_tab = BrowserTab.create(browser_tab_params)
		window = BrowserWindow.find(params[:browser_window_id])
		window.browser_tabs << new_tab
		redirect_to device_browser_window_path(device_id: window.device_id, id: window)
	end

	def update
		browser_tab = BrowserTab.find(params[:id])
		authorize browser_tab
		BrowserTab.update(browser_tab, browser_tab_params)
		redirect_to device_browser_window_path(browser_tab.device, browser_tab.browser_window)
	end

	def edit
		@browser_tab = BrowserTab.find(params[:id])
		authorize @browser_tab
		@browser_tabs = BrowserTab.all
	end

	private
		def browser_tab_params
      params.require(:browser_tab).permit(:url, :title, :private)
    end
end