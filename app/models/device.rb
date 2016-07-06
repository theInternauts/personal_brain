class Device < ActiveRecord::Base


	has_many :browser_windows
	has_many :browser_tabs, through: :browser_window
	belongs_to :user
	default_scope { order(created_at: :asc) }
end