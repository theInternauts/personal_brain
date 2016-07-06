class BrowserTab < ActiveRecord::Base
	has_one :device, through: :browser_window
	belongs_to :browser_window

	delegate :owner, to: :browser_window
end