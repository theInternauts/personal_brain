class AddUserIdToBookmarks < ActiveRecord::Migration[4.2]
  def change
  	add_reference :bookmarks, :user, index: true, foreign_key: true
  end
end
