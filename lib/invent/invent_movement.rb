require 'invent_update'
class InventMovement
  
  attr_accessor :origin_line
  
  @origin_line = nil

  def self.make (opts = {})
  	origin_line = opts[:origin_line]

  	case origin_line.class.name
  	 when "InventJournalLine" then movement = InventMovInvJournal.make opts
    end
  	
    movement.origin_line = origin_line

  	return movement
  end

  def qty
    return @origin_line.qty
  end
end

class InventMovInvJournal < InventMovement
  def self.make (opts = {})
  	line = opts[:origin_line]

  	case line.journal.journal_type
    	when 1 then movement = InventMovInvJournalTranfer.make opts
    	when 2 then movement = InventMovInvJournalCounting.make opts
    end

  	return movement
  end
end

class InventMovInvJournalTranfer < InventMovInvJournal
  def self.make (opts = {})
  	movement = InventMovInvJournalTranfer.new

  	return movement
  end

  def transact (opts = {})

    upd_onorder = InventUpdateOnOrder.make self
    upd_onorder.transact

    upd_ordered = InventUpdateOrdered.make self
    upd_ordered.transact
  end

  def item_id
    return @origin_line.item_id
  end

  def location_id
    return @origin_line.journal.location_id
  end

  def to_location_id
    return @origin_line.journal.to_location_id
  end

  def source_id
    return @origin_line.id
  end

  def source_type
    return @origin_line.class.name
  end
end