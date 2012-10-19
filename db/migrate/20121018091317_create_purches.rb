class CreatePurches < ActiveRecord::Migration
  def change
    create_table :purches do |t|
      t.string :number
      t.string :description
      t.string :type
      t.integer :dimension_id

      t.timestamps
    end
  end
end
