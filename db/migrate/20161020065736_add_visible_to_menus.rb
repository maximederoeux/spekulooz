class AddVisibleToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :visible, :boolean
  end
end
