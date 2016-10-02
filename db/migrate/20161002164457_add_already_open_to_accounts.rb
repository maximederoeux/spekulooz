class AddAlreadyOpenToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :already_open, :boolean
    add_column :accounts, :open_on, :date
    add_column :accounts, :open_check, :boolean
  end
end
