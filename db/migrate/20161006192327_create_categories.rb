class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.boolean :food
      t.boolean :drink
      t.integer :account_id

      t.timestamps
    end
  end
end
