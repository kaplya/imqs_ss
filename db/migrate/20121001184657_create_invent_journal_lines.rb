class CreateInventJournalLines < ActiveRecord::Migration
  def change
    create_table :invent_journal_lines do |t|
      t.integer :journal_id
      t.integer :item_id
      t.integer :dimension_id,    :null => false
      t.integer :to_dimension_id    
      t.decimal :qty,      :default => 0,  :null => false
      t.string :type

      t.timestamps
    end
  end
end
