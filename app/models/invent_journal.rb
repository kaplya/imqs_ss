class InventJournal < ActiveRecord::Base
  attr_accessible :description, :location_id, :number, :to_location_id, :type, :posted
  has_many :lines, class_name: "InventJournalLine", foreign_key: "journal_id"
  #set_inheritance_column :subtype

  def post
    self.transaction do 
      
      raise "Inventory Journal #{self.number} is already posted!" if self.posted    

      self.lines.each { |line| InventUpdatePosted.transact line }

      self.posted = true
      self.save
    end
  end

  def trans_location qty
    return self.location_id
  end
end

class InventJournalTransfer < InventJournal

  def transact_created_line line
    line.sign = -1
  	InventUpdateEstimated.transact line
    line.sign = 1
    InventUpdateEstimated.transact line
  end

  def trans_location_id
    if @sign > 0 then
      return self.to_location_id
    elsif @sign < 0
      return self.location_id
    end
  end
end


class InventJournalCount < InventJournal

  def transact_created_line line
  	InventUpdateEstimated.transact line, line.qty
  end
end
