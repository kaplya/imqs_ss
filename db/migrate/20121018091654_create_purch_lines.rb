class CreatePurchLines < ActiveRecord::Migration
  def change
    create_table :purch_lines do |t|
      t.integer :purch_id
      t.integer :item_id
      t.integer :dimension_id
      t.decimal :qty
      t.string :type
      t.decimal :price
      t.decimal :amount

      t.timestamps
    end
  end
end
