class AddIndexOnTagsAndBookmarks < ActiveRecord::Migration
  def change
  	add_index :tags, :name
  	add_index :bookmarks, :title
  	add_index :bookmarks, :url
  end
end
