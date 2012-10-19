module InventoryJournals
  require 'test_helper'

  class InventJournalTransferLineTest < ActiveSupport::TestCase

    def build_line_12
      @journal = InventJournalTransfer.create(
        dimension_id: 8,
        to_dimension_id: 9,
        number: "transfer0023")
      @line = @journal.lines.build(
        item_id: 1,
        dimension_id: 8,
        to_dimension_id: 9,
        qty: 12.0)
    end

    test "build line" do

      build_line_12

    	assert @line.journal_id == @journal.id, "the journal id is #{@journal.id} but the line has different id, #{@line.journal_id}"
    end


    test "negtive qty" do
      build_line_12
      @line.qty = -12

      assert @line.invalid?, "transfer line with negative qty should be invalid"
    end

    test "transactions on line creation" do

    	build_line_12

    	@line.save

      @line.sign = -1
    	trans_issue = @line.invent_transactions[0]
      @line.sign = 1
    	trans_receipt = @line.invent_transactions[0]

      assert !trans_issue.nil?, "the issue transaction have not been found"
      assert !trans_receipt.nil?, "the receipt transaction have not been found"

    	assert trans_issue.status_issue == 1, "status issue should be 1 not #{trans_issue.status_issue}" 
      assert trans_issue.qty == -12.0, "qty should be -12.0 not #{trans_issue.qty}"

      assert trans_receipt.status_receipt == 1, "status receipt should be 1 not #{trans_receipt.status_receipt}" 
      assert trans_receipt.qty == 12.0, "qty should be 12.0 not #{trans_receipt.qty}"
    end 

    test "transactions on qty changing" do

      build_line_12

      @line.save

      @line.qty = 6

      @line.save

      @line.sign = -1
      trans_issue = @line.invent_transactions[0]
      @line.sign = 1
      trans_receipt = @line.invent_transactions[0]

      assert trans_issue.status_issue == 1, "status issue should be 1 not #{trans_issue.status_issue}" 
      assert trans_issue.qty == -6.0, "qty should be -6.0 not #{trans_issue.qty}"

      assert trans_receipt.status_receipt == 1, "status receipt should be 1 not #{trans_receipt.status_receipt}" 
      assert trans_receipt.qty == 6.0, "qty should be 6.0 not #{trans_receipt.qty}"    
    end

    test "transactions on journal posting" do
      
      build_line_12

      @line.save

      @journal.post

      @line.sign = -1
      trans_issue = @line.invent_transactions[0]
      @line.sign = 1
      trans_receipt = @line.invent_transactions[0]

      assert !trans_issue.nil?, "the issue transaction have not been found"
      assert !trans_receipt.nil?, "the receipt transaction have not been found"

      assert trans_issue.status_issue == 3, "status issue should be 3 not #{trans_issue.status_issue}" 
      assert trans_issue.qty == -12.0, "qty should be -12.0 not #{trans_issue.qty}"

      assert trans_receipt.status_receipt == 3, "status receipt should be 3 not #{trans_receipt.status_receipt}" 
      assert trans_receipt.qty == 12.0, "qty should be 12.0 not #{trans_receipt.qty}"
    end

  end
end