class Device < ActiveRecord::Base
	
	
	has_many :browser_windows
	has_many :browser_tabs, through: :browser_window
end