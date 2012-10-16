class CreateInventJournals < ActiveRecord::Migration
  def change
    create_table :invent_journals do |t|
      t.string :number
      t.string :description
      t.string :type
      t.integer :dimension_id
      t.integer :to_dimension_id
      t.boolean :posted, default: false, null: false

      t.timestamps
    end
  end
end
