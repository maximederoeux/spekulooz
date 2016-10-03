class AddAttachmentBgPictOneToAccounts < ActiveRecord::Migration
  def self.up
    change_table :accounts do |t|
      t.attachment :bg_pict_one
    end
  end

  def self.down
    remove_attachment :accounts, :bg_pict_one
  end
end
