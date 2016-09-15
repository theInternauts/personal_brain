class CreateBrowserWindows < ActiveRecord::Migration
  def change
    create_table :browser_windows do |t|
    	t.boolean :private, default: false
    	t.timestamps null: false
    end
  end
end
