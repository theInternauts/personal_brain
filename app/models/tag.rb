class Tag < ActiveRecord::Base
	has_and_belongs_to_many :bookmarks
	default_scope { order(name: :asc) }

	scope :owned_by, ->(user) { joins(bookmarks: :user).where("bookmarks.user_id = ?", user.id).distinct }
end