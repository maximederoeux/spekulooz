class AddFreeToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :free, :boolean
    add_column :accounts, :pack_one, :boolean
    add_column :accounts, :pack_two, :boolean
  end
end
