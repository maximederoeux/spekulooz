class RemoveMenuDesignFromAccounts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :accounts, :menu_design, :integer 
  end
end
