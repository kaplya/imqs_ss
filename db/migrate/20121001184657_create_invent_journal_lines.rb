class CreateInventJournalLines < ActiveRecord::Migration
  def change
    create_table :invent_journal_lines do |t|
      t.integer :journal_id
      t.integer :item_id
      t.decimal :qty,      :default => 0,  :null => false

      t.timestamps
    end
  end
end
