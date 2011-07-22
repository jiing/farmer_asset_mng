class RenameColumnUserIdInRequisitions < ActiveRecord::Migration
  def self.up
    rename_column :requisitions, :user_id, :borrower_id
  end

  def self.down
  end
end
