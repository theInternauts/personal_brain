class Bookmark < ActiveRecord::Base
	validates :url, presence: true, uniqueness: { message: "This bookmark already exists." }
	belongs_to :user
	has_and_belongs_to_many :tags

	default_scope { order(created_at: :desc) }

	def owner
		user
	end
end