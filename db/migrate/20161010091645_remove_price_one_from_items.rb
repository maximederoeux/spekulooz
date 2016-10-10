class RemovePriceOneFromItems < ActiveRecord::Migration[5.0]
  def change
   	remove_column :items, :price_one, :decimal
   	remove_column :items, :price_two, :decimal
   	remove_column :items, :price, :decimal
  end
end
