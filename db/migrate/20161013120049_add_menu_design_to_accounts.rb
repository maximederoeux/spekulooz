class AddMenuDesignToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :menu_design, :integer
  end
end
