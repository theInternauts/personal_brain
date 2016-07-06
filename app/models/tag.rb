class Tag < ActiveRecord::Base
	has_and_belongs_to_many :bookmarks
	default_scope { order(name: :asc) }
end