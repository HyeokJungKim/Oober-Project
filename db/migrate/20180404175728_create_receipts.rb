class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :rider_id
      t.integer :driver_id
      t.float :cost
    end

  end
end
