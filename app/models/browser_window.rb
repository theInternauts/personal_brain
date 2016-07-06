class BrowserWindow < ActiveRecord::Base
	belongs_to :device
	has_many :browser_tabs

	delegate :owner, to: :device
end