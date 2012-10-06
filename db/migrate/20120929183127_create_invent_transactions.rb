class CreateInventTransactions < ActiveRecord::Migration
  def change
    create_table :invent_transactions do |t|
      t.string :item_id
      t.string :location_id
      t.integer :source_id
      t.string :source_type
      t.integer :status_receipt
      t.integer :status_issue
      t.decimal :qty,      :default => 0,  :null => false

      t.timestamps
    end
  end
end
