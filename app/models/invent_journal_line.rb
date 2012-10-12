class InventJournalLine < ActiveRecord::Base # try to inherit from journal
  attr_accessible :item_id, :journal_id, :journal_number, :qty
  belongs_to :journal, class_name: "InventJournal", foreign_key: "journal_id"


  after_create :transact_created_line

  @sign = 1
  attr_accessor :sign

  def location_id
    self.journal.location_id
  end

  def to_location_id
    self.journal.to_location_id
  end

  def trans_location_id
    self.journal.location_id
  end

  def trans_item_id
    self.item_id
  end

  def trans_qty
    self.qty * @sign
  end

end

class InventJournalTransferLine < InventJournalLine
  belongs_to :journal, class_name: "InventJournalTransfer", foreign_key: "journal_id"

  def trans_location_id
    if (@sign > 0) then
      return self.journal.to_location_id
    elsif (@sign < 0) then
      return self.journal.location_id
    end
  end

  def transact_posted_line
    self.sign = -1
    InventUpdatePosted.transact self
    self.sign = 1
    InventUpdatePosted.transact self
  end  

  def transact_created_line
    self.sign = -1
    InventUpdateEstimated.transact self
    self.sign = 1
    InventUpdateEstimated.transact self
  end
end

class InventJournalCountLine < InventJournalLine
  belongs_to :journal, class_name: "InventJournalCount", foreign_key: "journal_id"

  def transact_created_line
    InventUpdateEstimated.transact self
  end

  def transact_posted_line line
    InventUpdatePosted.transact self
  end
end