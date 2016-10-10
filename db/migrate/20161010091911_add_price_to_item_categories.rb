class AddPriceToItemCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :item_categories, :price, :decimal
    add_column :item_categories, :food, :boolean
    add_column :item_categories, :drink, :boolean
  end
end
