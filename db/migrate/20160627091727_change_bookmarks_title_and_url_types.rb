class ChangeBookmarksTitleAndUrlTypes < ActiveRecord::Migration
  def change
  	change_column :bookmarks, :title, :text
  	change_column :bookmarks, :url, :text
  end
end
