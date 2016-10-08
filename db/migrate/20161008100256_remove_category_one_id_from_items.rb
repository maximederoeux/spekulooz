class RemoveCategoryOneIdFromItems < ActiveRecord::Migration[5.0]
  def change
  	remove_column :items, :category_one_id, :integer
  	remove_column :items, :category_two_id, :integer
  	remove_column :items, :menu_one_id, :integer
  	remove_column :items, :menu_two_id, :integer
  end
end
