class CreateInventOnhands < ActiveRecord::Migration
  def change
    create_table :invent_onhands do |t|
      t.string :item_id
      t.string :location_id
      t.decimal :ordered_qty,      :default => 0,  :null => false
      t.decimal :on_order_qty,      :default => 0,  :null => false
      t.decimal :physical_qty,      :default => 0,  :null => false
      t.decimal :posted_qty,      :default => 0,  :null => false

      t.timestamps
    end
  end
end
