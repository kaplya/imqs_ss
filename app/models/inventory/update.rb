module Inventory
  class Update

    attr_accessor :source_hash
    @source_hash = {}

    def transact
      transes = Transaction.abs_by_source(@source_hash)

      if transes == [] then 
        transes << init_trans(Transaction.new)
      end

      transes.each do |trans|
        init_trans trans
        set_statuses trans
        trans.save
      end
    end

    def init_trans trans
      trans.source_id = @source_hash[:source_id]
      trans.source_type = @source_hash[:source_type]

      trans.dimension_id = @source_hash[:trans_dimension_id]
      trans.item_id = @source_hash[:trans_item_id]
      trans.qty = @source_hash[:trans_qty]

      return trans
    end
  end

  class UpdateEstimated < Update

    def self.transact(source_hash)
      update = UpdateEstimated.new
      update.source_hash = source_hash

      update.transact
    end

    def set_statuses(trans)
      trans.status_receipt = (trans.qty > 0 ? 1 : 0)
      trans.status_issue = (trans.qty < 0 ? 1 : 0)
    end
  end

  class UpdatePhysical < Update
      
    def self.transact(source_hash)
      update = UpdatePhysical.new
      update.source_hash = source_hash

      update.transact   
    end

    def set_statuses(trans)
      trans.status_receipt = (trans.qty > 0 ? 2 : 0)
      trans.status_issue = (trans.qty < 0 ? 2 : 0)
    end
  end

  class UpdatePosted < Update
      
    def self.transact(source_hash)
      update = UpdatePosted.new
      update.source_hash = source_hash

      update.transact   
    end

    def set_statuses(trans)
      trans.status_receipt = (trans.qty > 0 ? 3 : 0)
      trans.status_issue = (trans.qty < 0 ? 3 : 0)
    end
  end
end