class InventUpdate

  attr_accessor :movement
  @movement = nil

  def self.make (type)

  end
end

class InventUpdateOrdered < InventUpdate
  def self.make mov

  	invent_update = InventUpdateOrdered.new
    invent_update.setup_movement mov

    return invent_update
  end

  def setup_movement mov
    @movement = mov
  end

  def transact
    trans = InventTransaction.new(
      )
    trans.location_id = @movement.to_location_id
    trans.item_id = @movement.item_id
    trans.qty = @movement.qty
    trans.status_receipt = 1
    trans.status_issue = 0
    trans.source_id = @movement.source_id
    trans.source_type = @movement.source_type

    trans.save
  end
end

class InventUpdateOnOrder < InventUpdate
  def self.make mov

    invent_update = InventUpdateOnOrder.new
    invent_update.setup_movement mov

    return invent_update
  end

  def setup_movement mov
    @movement = mov
  end

  def transact
    trans = InventTransaction.new(
      )
    trans.location_id = @movement.location_id
    trans.item_id = @movement.item_id
    trans.qty = @movement.qty * -1
    trans.status_receipt = 0
    trans.status_issue = 1
    trans.source_id = @movement.source_id
    trans.source_type = @movement.source_type

    trans.save
  end
end