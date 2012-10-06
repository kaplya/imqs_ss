class InventJournal < ActiveRecord::Base
  attr_accessible :description, :location_id, :number, :to_location_id, :journal_type
  has_many :lines, class_name: "InventJournalLine", foreign_key: "journal_id"
  #set_inheritance_column :subtype

  def post
  	
  end
end
