class AddAccountIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :account_id, :integer
  end
end
