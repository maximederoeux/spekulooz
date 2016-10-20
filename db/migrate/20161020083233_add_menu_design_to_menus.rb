class AddMenuDesignToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :menu_design, :integer
  end
end
