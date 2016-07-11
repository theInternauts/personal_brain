class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name
  validates_presence_of :name, :slug

	has_and_belongs_to_many :bookmarks
	default_scope { order(name: :asc) }

	scope :owned_by, ->(user) { joins(bookmarks: :user).where("bookmarks.user_id = ?", user.id).distinct }

	def should_generate_new_friendly_id?
    name_changed? || super
  end
end