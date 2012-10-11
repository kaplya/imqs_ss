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

    trans.location_id = @source.trans_location_id
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

    trans = InventTransaction.find_by_source_line @source

    trans.status_receipt = (trans.qty > 0 ? 3 : 0)
    trans.status_issue = (trans.qty < 0 ? 3 : 0)

    trans.save
  end 
end
