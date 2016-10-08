class RemoveCategoryOneIdFromCategories < ActiveRecord::Migration[5.0]
  def change
  	remove_column :categories, :category_one_id, :integer
  	remove_column :categories, :category_two_id, :integer
  	remove_column :categories, :menu_one_id, :integer
  	remove_column :categories, :menu_two_id, :integer
  end
end
