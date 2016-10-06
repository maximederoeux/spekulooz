class AddDescriptionToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :description, :string
    add_column :items, :active, :boolean
    add_column :items, :start_date, :date
    add_column :items, :end_date, :date
    add_column :items, :category_one_id, :integer
    add_column :items, :category_two_id, :integer
    add_column :items, :price_one, :decimal
    add_column :items, :price_two, :decimal
    add_column :items, :menu_one_id, :integer
    add_column :items, :menu_two_id, :integer
    add_column :items, :food, :boolean
    add_column :items, :drink, :boolean
  end
end
