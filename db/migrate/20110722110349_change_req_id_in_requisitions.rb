class ChangeReqIdInRequisitions < ActiveRecord::Migration
  def self.up
    change_column :requisitions, :req_id, :string
    add_index :requisitions, :req_id
  end

  def self.down
     change_column :requisitions, :req_id, :integer
     remove_index :requisitions, :req_id
  end
end
