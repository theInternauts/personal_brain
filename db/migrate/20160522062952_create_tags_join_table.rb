class CreateTagsJoinTable < ActiveRecord::Migration[4.2]
  def change
  	drop_table :taggings

  	create_join_table :bookmarks, :tags do |t|
		  t.index :bookmark_id
		  t.index :tag_id
      t.timestamps null: :false
		end
  end
end
