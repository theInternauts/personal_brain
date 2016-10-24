class AddIndexOnTagsAndBookmarks < ActiveRecord::Migration
  def change
  	add_index :tags, :name
  	add_index :bookmarks, :title, :length => { :title => 256 }
  	add_index :bookmarks, :url, :length => { :url => 256 }
  end
end
