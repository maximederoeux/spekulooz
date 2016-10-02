class AddPrevalidateSubToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :prevalidate_sub, :boolean
  end
end
