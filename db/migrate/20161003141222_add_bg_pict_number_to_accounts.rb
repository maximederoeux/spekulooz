class AddBgPictNumberToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :bg_pict_number, :integer
  end
end
