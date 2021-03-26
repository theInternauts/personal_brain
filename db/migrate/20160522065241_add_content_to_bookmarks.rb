class AddContentToBookmarks < ActiveRecord::Migration[4.2]
  def change
  	add_column :bookmarks, :comment, :text
  end
end
