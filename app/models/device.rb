class Device < ActiveRecord::Base
	belongs_to :user
	has_many :browser_windows
	has_many :browser_tabs, through: :browser_window

	default_scope { order(created_at: :asc) }

	def owner
		user
	end
end