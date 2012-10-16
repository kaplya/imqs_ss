class InventJournal < ActiveRecord::Base
  attr_accessible :description, :dimension_id, :number, :to_dimension_id, :type, :posted
  has_many :lines, class_name: "InventJournalLine", foreign_key: "journal_id"

  validates :number, presence: true
  validates :dimension_id, presence: true

  def post
    self.transaction do 
      
      raise "Inventory Journal #{self.number} is already posted!" if self.posted    

      self.lines.each do |line| 
        line.transact_posted
      end

      self.posted = true
      self.save
    end
  end
end

class InventJournalTransfer < InventJournal
  has_many :lines, class_name: "InventJournalTransferLine", foreign_key: "journal_id"
  validates :to_dimension_id, presence: true
end


class InventJournalCount < InventJournal
  has_many :lines, class_name: "InventJournalCountLine", foreign_key: "journal_id"
  
end
