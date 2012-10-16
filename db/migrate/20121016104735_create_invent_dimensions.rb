class CreateInventDimensions < ActiveRecord::Migration
  def change
    create_table :invent_dimensions do |t|
      t.integer :location_id
      t.integer :batch_id
      t.integer :color_id
      t.integer :size_id

      t.timestamps
    end
  end
end
