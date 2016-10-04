class AddCityToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :city, :string
    add_column :accounts, :email, :string
  end
end
