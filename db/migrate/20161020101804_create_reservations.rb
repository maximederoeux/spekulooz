class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :name
      t.integer :account_id
      t.datetime :requested_time
      t.integer :pax
      t.string :email
      t.string :mobile
      t.string :comment

      t.timestamps
    end
  end
end
