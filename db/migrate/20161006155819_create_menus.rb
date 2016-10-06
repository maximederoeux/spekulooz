class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.boolean :active
      t.boolean :food
      t.boolean :drink
      t.integer :period_quantity
      t.string :period
      t.boolean :promote
      t.decimal :price
      t.string :status
      t.integer :account_id

      t.timestamps
    end
  end
end
