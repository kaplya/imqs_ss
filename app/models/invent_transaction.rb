class InventTransaction < ActiveRecord::Base
  attr_accessible :item_id, :location_id, :qty, :status_issue, :status_receipt, :source_id, :source_type

  before_create :update_onhand_with_created_transaction
  before_destroy :update_onhand_with_deleted_transaction
  before_update :update_onhand_with_updated_transaction


  def relative_onhand
  	return InventOnhand.find_or_initialize_by_item_id_and_location_id(self.item_id, self.location_id)
  end

  def original
  	return InventTransaction.find(self.id)
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
      transes = InventTransaction.where(
        status_issue: 0,
        source_id: source_line.id,
        source_type: source_line.class.name)
    elsif source_line.trans_qty < 0 then
      transes = InventTransaction.where(
        status_receipt: 0,
        source_id: source_line.id,
        source_type: source_line.class.name)
    end
    return transes
  end

  def self.get_aggr_by_source_line(source_line) 
    if source_line.trans_qty > 0 then
      trans = InventTransaction.where(
        status_issue: 0,
        source_id: source_line.id,
        source_type: source_line.class.name).sum( :qty)
    elsif source_line.trans_qty < 0 then
      trans = InventTransaction.where(
        status_receipt: 0,
        source_id: source_line.id,
        source_type: source_line.class.name).sum( :qty)
    end
    return trans
  end
end
