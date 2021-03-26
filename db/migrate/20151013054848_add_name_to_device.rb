class AddNameToDevice < ActiveRecord::Migration[4.2]
  def change
    add_column :devices, :name, :string
  end
end
