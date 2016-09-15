class AddFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :full_name, :string, null: :false
  	add_column :users, :username, :string, null: :false
  	add_column :users, :slug, :string, null: :false

  	add_index :users, :username, unique: true
  	add_index :users, :slug, unique: true
  end
end
