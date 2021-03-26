class ChangeBookmarksTitleAndUrlTypes < ActiveRecord::Migration[4.2]
  def change
  	change_column :bookmarks, :title, :text
  	change_column :bookmarks, :url, :text
  end
end
