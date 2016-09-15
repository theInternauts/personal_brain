class CreateTagsTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps null: :false
    end

    create_table :taggings do |t|
      t.references :tag, index: true
      t.references :bookmark, index: true
      t.string :type, null: :false
      t.timestamps null: :false
    end
  end
end
