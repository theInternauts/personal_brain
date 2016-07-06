class User < ActiveRecord::Base
  include Clearance::User

  has_many :devices
  has_many :bookmarks
end
