class InventJournalLine < ActiveRecord::Base
  attr_accessible :item_id, :journal_id, :journal_number, :qty
  belongs_to :journal, class_name: "InventJournal", foreign_key: "journal_id"

  after_create :transact_created_line

  def transact_created_line
  	mov = InventMovement.make origin_line: self
  	mov.transact
  end

  def transact_changed_line
  	mov = InventMovement.make origin_line: self
  	mov.transact
  end
end
