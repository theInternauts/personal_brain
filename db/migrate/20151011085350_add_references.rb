class AddReferences < ActiveRecord::Migration
  def change
  	add_reference :browser_tabs, :browser_window, index: true
  	add_reference :browser_windows, :device, index: true
  end
end
