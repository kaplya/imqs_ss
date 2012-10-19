class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :dimension_id
      t.decimal :qty
      t.decimal :price
      t.decimal :amount
      t.string :type

      t.timestamps
    end
  end
end
