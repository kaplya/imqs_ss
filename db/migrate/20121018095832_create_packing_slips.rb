class CreatePackingSlips < ActiveRecord::Migration
  def change
    create_table :packing_slips do |t|
      t.integer :purch_id
      t.string :number
      t.string :description
      t.string :type
      t.boolean :posted, default: false, null: false

      t.timestamps
    end
  end
end
