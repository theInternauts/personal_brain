class Bookmark < ActiveRecord::Base
	validates :url, presence: true, uniqueness: { message: "This bookmark already exists." }
	belongs_to :user
	has_and_belongs_to_many :tags

	default_scope { order(created_at: :desc) }
	scope :owned_by, ->(user) { where(user: user) }
	scope :public_bookmarks, -> { where(private: false) }

	def owner
		user
	end
end