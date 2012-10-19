module Inventory
  class Transaction < ActiveRecord::Base
    attr_accessible :item_id, :dimension_id, :qty, :status_issue, :status_receipt, :source_id, :source_type
    
    belongs_to :dimension, class_name: "Dimension", foreign_key: "dimension_id"

    before_create :update_onhand_with_created_transaction
    before_destroy :update_onhand_with_deleted_transaction
    before_update :update_onhand_with_updated_transaction


    def relative_onhand
    	return Onhand.find_or_initialize_by_item_id_and_dimension_id(self.item_id, self.dimension_id)
    end

    def original
    	return Transaction.find(self.id)
    end

    def update_onhand_with_created_transaction
    	onhand = relative_onhand
    	onhand.plus_transaction(self)
    end
    
    def update_onhand_with_deleted_transaction
    	onhand = relative_onhand
    	onhand.minus_transaction(self)
    end
    
    def update_onhand_with_updated_transaction
    	onhand = relative_onhand
    	onhand.minus_transaction(original)
    	onhand.plus_transaction(self)
    end
    
    def self.find_by_source_line(source_line)
      if source_line.trans_qty > 0 then
        transes = Transaction.where(
          status_issue: 0,
          source_id: source_line.id,
          source_type: source_line.class.name)
      elsif source_line.trans_qty < 0 then
        transes = Transaction.where(
          status_receipt: 0,
          source_id: source_line.id,
          source_type: source_line.class.name)
      end
      return transes
    end

    def self.abs_by_source(source_hash = {})
      qty = source_hash[:trans_qty]
      if qty > 0 then
        transes = Transaction.where(
          status_issue: 0,
          source_id: source_hash[:source_id],
          source_type: source_hash[:source_type])
      elsif qty < 0 then
        transes = Transaction.where(
          status_receipt: 0,
          source_id: source_hash[:source_id],
          source_type: source_hash[:source_type])
      else
        transes = []
      end
      return transes
    end

    def self.get_aggr_by_source_line(source_line) 
      if source_line.trans_qty > 0 then
        trans = Transaction.where(
          status_issue: 0,
          source_id: source_line.id,
          source_type: source_line.class.name).sum( :qty)
      elsif source_line.trans_qty < 0 then
        trans = Transaction.where(
          status_receipt: 0,
          source_id: source_line.id,
          source_type: source_line.class.name).sum( :qty)
      end
      return trans
    end
  end
end