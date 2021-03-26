class AddIndexOnTagsAndBookmarks < ActiveRecord::Migration[4.2]
  def change
  	add_index :tags, :name
  	add_index :bookmarks, :title, :length => { :title => 256 }
  	add_index :bookmarks, :url, :length => { :url => 256 }
  end
end
