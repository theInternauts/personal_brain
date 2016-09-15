class User < ActiveRecord::Base
  include Clearance::User
  extend FriendlyId
  friendly_id :username
  validates_presence_of :username, :email, :full_name
  validates_uniqueness_of :username

  has_many :devices
  has_many :bookmarks
end
