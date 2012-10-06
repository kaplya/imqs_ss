class CreateInventJournals < ActiveRecord::Migration
  def change
    create_table :invent_journals do |t|
      t.string :number
      t.string :description
      t.integer :journal_type
      t.integer :location_id
      t.integer :to_location_id

      t.timestamps
    end
  end
end
