class BrowserTab < ActiveRecord::Base
	
	
	belongs_to :browser_window
	has_one :device, through: :browser_window
end