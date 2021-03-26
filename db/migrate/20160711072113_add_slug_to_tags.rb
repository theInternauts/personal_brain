class AddSlugToTags < ActiveRecord::Migration[4.2]
  def change
  	add_column :tags, :slug, :string, null: :false
  	add_index :tags, :slug, unique: :true
  end
end
