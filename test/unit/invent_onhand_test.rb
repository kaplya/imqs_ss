module InventoryBasic
	require 'test_helper'

	class InventOnhandTest < ActiveSupport::TestCase


	  # test "the truth" do
	  #   assert true
	  # end


	  test "negative qty" do
	  	onhand = InventOnhand.new(
	  		item_id: 1,
	  		dimension_id: 1)

	  	onhand.posted_qty = -1

	  	assert onhand.invalid?, "posted_qty should not be negative"
	  
	  	onhand.posted_qty = 0
	  	onhand.physical_qty = -1

		assert onhand.invalid?, "physical_qty should not be negative"  	

	  end

	  test "orderer qty on transaction update" do

		transacted_qty = 3.21

		trans = InventTransaction.new
		trans.dimension_id = 1
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
end