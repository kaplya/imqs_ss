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
    transes = @source.invent_transactions

    if transes.nil? or (transes == []) then 
      transes << InventTransaction.new
    end

    transes.each do |trans|
      @source.init_trans trans
      set_statuses trans
      trans.save
    end
    
  end

  def set_statuses trans
    trans.status_receipt = (trans.qty > 0 ? 1 : 0)
    trans.status_issue = (trans.qty < 0 ? 1 : 0)
  end

end

class InventUpdatePosted < InventUpdate
    
  def self.transact source
    update = InventUpdatePosted.new
    update.source = source

    update.transact   
  end

  def transact
    transes = @source.invent_transactions

    if transes.nil? or (transes == []) then 
      transes << InventTransaction.new
    end

    transes.each do |trans|
      set_statuses trans
      trans.save
    end
  end 

  def set_statuses trans
    trans.status_receipt = (trans.qty > 0 ? 3 : 0)
    trans.status_issue = (trans.qty < 0 ? 3 : 0)
  end
end
