class CreateRequisitions < ActiveRecord::Migration
  def self.up
    create_table :requisitions do |t|
      t.integer :req_id
      t.string :account_name
      t.datetime :borrowed_at
      t.integer :reason_id
      t.integer :user_id
      t.text :note
      t.integer :category_id
      t.boolean :is_borrowed

      t.timestamps
    end
  end

  def self.down
    drop_table :requisitions
  end
end
