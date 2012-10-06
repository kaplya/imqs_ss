require 'test_helper'

class InventOnhandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "orderer qty on transaction update" do

  	transacted_qty = 3.21

  	trans = InventTransaction.new
  	trans.location_id = 1
	trans.item_id = 1  	
	trans.status_receipt = 1
	trans.status_issue = 0	
	trans.qty = transacted_qty
	trans.save
	onhand = trans.relative_onhand
	
	
	assert !onhand.nil?, 'Onhand have not been created'

	assert onhand.ordered_qty == transacted_qty, "Ordered qty is #{onhand.ordered_qty} but should be #{transacted_qty}!"
  
  	transacted_qty += 5
	trans.qty = transacted_qty
	trans.save

	onhand.reload

	assert onhand.ordered_qty == transacted_qty, "Ordered qty is #{onhand.ordered_qty} but should be #{transacted_qty}!"
  
  	trans.destroy

	onhand.reload

	assert onhand.ordered_qty == 0, "Ordered qty is #{onhand.ordered_qty} bu should be zero!"

  end

  
end
