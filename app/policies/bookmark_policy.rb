class BookmarkPolicy < ApplicationPolicy
	attr_reader :user, :bookmark

	def initialize(user, bookmark)
		@user = user
		@bookmark = bookmark
	end

	def can_view?
		@user === bookmark.owner
	end

	# def show?
	# 	@user === bookmark.owner
	# end

	def is_owner?
		@user === bookmark.owner
	end
end