class Bookmark < ActiveRecord::Base
	validates :url, presence: true, uniqueness: { message: "This bookmark already exists." }
	has_and_belongs_to_many :tags
	belongs_to :user
end