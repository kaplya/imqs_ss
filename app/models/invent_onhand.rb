class InventOnhand < ActiveRecord::Base
  attr_accessible :item_id, :location_id, :on_order_qty, :ordered_qty, :physical_qty, :posted_qty
  validates :posted_qty, numericality: {greater_than_or_equal_to: 0}
  validates :physical_qty, numericality: {greater_than_or_equal_to: 0}

  def plus_transaction(trans)
  	# if we add the transaction we pass +1
  	invoke_transaction trans, +1
  end


  def minus_transaction(trans)
  	# if we substract the transaction we pass -1
  	invoke_transaction trans, -1
  end

  def invoke_transaction(trans, direction)
  	# this holds the logic about how inventory transactions of different statuses reflect on inventory onhands
  	# if there will be any new isuue or receipt statuses they should be here too
  	qty = trans.qty * direction

  	if trans.status_issue == 0 then
  		case trans.status_receipt
  			when 1 then self.ordered_qty += qty
  			when 2 then self.physical_qty += qty
  			when 3 then self.posted_qty += qty
		  end
  	else
  		case trans.status_issue
  			when 1 then self.on_order_qty -= qty
  			when 2 then self.physical_qty += qty
  			when 3 then self.posted_qty += qty
		  end
  	end

  	save
  
  end
end
