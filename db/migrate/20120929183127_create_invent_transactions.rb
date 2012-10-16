class CreateInventTransactions < ActiveRecord::Migration
  def change
    create_table :invent_transactions do |t|
      t.integer :item_id,    :null => false
      t.integer :dimension_id,    :null => false
      t.integer :source_id
      t.string :source_type
      t.integer :status_receipt
      t.integer :status_issue
      t.decimal :qty,      :default => 0,  :null => false

      t.timestamps
    end
  end
end
