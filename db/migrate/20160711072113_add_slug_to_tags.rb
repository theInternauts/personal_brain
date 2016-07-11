class AddSlugToTags < ActiveRecord::Migration
  def change
  	add_column :tags, :slug, :string, null: :false
  	add_index :tags, :slug, unique: :true
  end
end
