class CreateBorrowers < ActiveRecord::Migration
  def self.up
    create_table :borrowers do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :borrowers
  end
end
