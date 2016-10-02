class AddSelectSubOneToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :select_sub_one, :boolean
    add_column :accounts, :select_sub_two, :boolean
    add_column :accounts, :select_sub_three, :boolean
    add_column :accounts, :validate_sub, :boolean
  end
end
