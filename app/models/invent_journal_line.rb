class InventJournalLine < ActiveRecord::Base # try to inherit from journal
  attr_accessible :item_id, :journal_id, :journal_number, :qty
  belongs_to :journal, class_name: "InventJournal", foreign_key: "journal_id"


  after_create :transact_created_line

  @sign = 1
  attr_accessor :sign

  def transact_created_line
  	self.journal.transact_created_line self
  end

  def location_id
    self.journal.location_id
  end

  def to_location_id
    self.journal.to_location_id
  end

  def trans_location_id
    if self.journal.type = InventJournalTransfer then
      if (@sign > 0) then
        return self.journal.to_location_id
      elsif (@sign < 0) then
        return self.journal.location_id
      end
    else
      return self.journal.location_id
    end
  end

  def trans_item_id
    return self.item_id
  end

  def trans_qty
    return self.qty * @sign
  end

end
