class AddAddressToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :address, :string
    add_column :accounts, :zipcode, :string
    add_column :accounts, :country, :string
    add_column :accounts, :phone, :string
    add_column :accounts, :fax, :string
    add_column :accounts, :mobile, :string
    add_column :accounts, :facebook, :string
    add_column :accounts, :twitter, :string
    add_column :accounts, :instagram, :string
    add_column :accounts, :google, :string
    add_column :accounts, :snapchat, :string
    add_column :accounts, :youtube, :string
    add_column :accounts, :vimeo, :string
  end
end
