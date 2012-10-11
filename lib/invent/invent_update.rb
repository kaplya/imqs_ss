class InventUpdate

  attr_accessor :source
  @source = nil

end

class InventUpdateEstimated < InventUpdate

  def self.transact source
    update = InventUpdateEstimated.new
    update.source = source

    update.transact   
  end

  def transact
    trans = InventTransaction.new

    trans.source_id = @source.id
    trans.source_type = @source.class.name

    trans.location_id = @source.trans_location_id #wrong!
    trans.item_id = @source.trans_item_id
    trans.qty = @source.trans_qty

    trans.status_receipt = (trans.qty > 0 ? 1 : 0)
    trans.status_issue = (trans.qty < 0 ? 1 : 0)

    trans.save
  end
end

class InventUpdatePosted < InventUpdate
    
  def self.transact source
    update = InventUpdatePosted.new
    update.source = source

    update.transact   
  end

  def transact

    trans_issue = InventTransaction.find_by_source_line @source, direction: :issue
    trans_receipt = InventTransaction.find_by_source_line @source, direction: :receipt

    raise "Could not find any transactions for #{@source.type} id #{@source.id}" if trans_issue.nil? && trans_receipt.nil? 
    
    if !trans_issue.nil? then
      trans_issue.status_issue = 3
      trans_issue.save
    end

    if !trans_receipt.nil? then
      trans_receipt.status_receipt = 3
      trans_receipt.save
    end

  end 
end
