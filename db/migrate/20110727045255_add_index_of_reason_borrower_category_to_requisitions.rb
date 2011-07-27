class AddIndexOfReasonBorrowerCategoryToRequisitions < ActiveRecord::Migration
  def self.up
    add_index :requisitions, :reason_id
    add_index :requisitions, :borrower_id
    add_index :requisitions, :category_id
  end

  def self.down
    remove_index :requisitions, :reason_id
    remove_index :requisitions, :borrower_id
    remove_index :requisitions, :category_id
  end
end
