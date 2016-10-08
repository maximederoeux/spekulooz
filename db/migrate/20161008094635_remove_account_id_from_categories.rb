class RemoveAccountIdFromCategories < ActiveRecord::Migration[5.0]
  def change
  	remove_column :categories, :account_id, :integer
  end
end
