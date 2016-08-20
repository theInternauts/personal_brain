class TagPolicy < ApplicationPolicy
	def is_owner?
		if record.bookmarks.present?
			record.bookmarks.where(user: user).exists?
		else
			# there are no records to have tags at all so return TRUE to avoid showing the user an error message unfairly
			true
		end
	end
end