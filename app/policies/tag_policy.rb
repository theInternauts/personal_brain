class TagPolicy < ApplicationPolicy
	def is_owner?
		record.bookmarks.where(user: user).exists?
	end
end