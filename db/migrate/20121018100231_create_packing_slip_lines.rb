class CreatePackingSlipLines < ActiveRecord::Migration
  def change
    create_table :packing_slip_lines do |t|
      t.integer :slip_id
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
