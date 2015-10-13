class BrowserWindow < ActiveRecord::Base
	
	
	has_many :browser_tabs
	belongs_to :device
end