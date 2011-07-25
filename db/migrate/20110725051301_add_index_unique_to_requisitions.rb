class AddIndexUniqueToRequisitions < ActiveRecord::Migration
  def self.up
     remove_index :requisitions, :req_id
     add_index :requisitions, :req_id, :unique=>true
  end

  def self.down
    add_index :requisitions, :req_id
    remove_index  :requisitions, :req_id
  end
end
