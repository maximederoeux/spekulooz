class AddRestoNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :resto_name, :string
  end
end
