class AddContentToBookmarks < ActiveRecord::Migration
  def change
  	add_column :bookmarks, :comment, :text
  end
end
