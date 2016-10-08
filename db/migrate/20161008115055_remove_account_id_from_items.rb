class RemoveAccountIdFromItems < ActiveRecord::Migration[5.0]
  def change
  	remove_column :items, :account_id, :integer
  end
end
