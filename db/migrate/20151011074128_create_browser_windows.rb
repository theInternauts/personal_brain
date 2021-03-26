class CreateBrowserWindows < ActiveRecord::Migration[4.2]
  def change
    create_table :browser_windows do |t|
    	t.boolean :private, default: false
    	t.timestamps null: false
    end
  end
end
