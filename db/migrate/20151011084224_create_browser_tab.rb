class CreateBrowserTab < ActiveRecord::Migration
  def change
    create_table :browser_tabs do |t|
    	t.string :url
    	t.string :title
    	t.boolean :private, default: false
    	t.timestamps null: false
    end
  end
end
