#TODO think about helper to setup expected results and copmare them to the outcome we have
#so that we won't have to do something like 'assert trans_issue.status_issue == 1'
require 'test_helper'

class InventJournalLineTest < ActiveSupport::TestCase

  def build_line_12
    @journal = InventJournalTransfer.create(
      location_id: 8,
      to_location_id: 9,
      number: "transfer0023")
    @line = @journal.lines.build(
      item_id: 1,
      qty: 12.0)
  end

  test "build line" do

    build_line_12

  	assert @line.journal_id == @journal.id, "the journal id is #{@journal.id} but the line has different id, #{@line.journal_id}"
  end


  test "transactions on line creation" do

  	build_line_12

  	@line.save

  	trans_issue = InventTransaction.find_by_source_line @line, direction: :issue
  	trans_receipt = InventTransaction.find_by_source_line @line, direction: :receipt

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

    trans_issue = InventTransaction.find_by_source_line @line, direction: :issue
    trans_receipt = InventTransaction.find_by_source_line @line, direction: :receipt

    assert trans_issue.status_issue == 1, "status issue should be 1 not #{trans_issue.status_issue}" 
    assert trans_issue.qty == -6.0, "qty should be -6.0 not #{trans_issue.qty}"

    assert trans_receipt.status_receipt == 1, "status receipt should be 1 not #{trans_receipt.status_receipt}" 
    assert trans_receipt.qty == 6.0, "qty should be 6.0 not #{trans_receipt.qty}"    
  end

  test "transactions on journal posting" do
    
    build_line_12

    @line.save

    @journal.post

    trans_issue = InventTransaction.find_by_source_line @line, direction: :issue
    trans_receipt = InventTransaction.find_by_source_line @line, direction: :receipt

    assert !trans_issue.nil?, "the issue transaction have not been found"
    assert !trans_receipt.nil?, "the receipt transaction have not been found"

    assert trans_issue.status_issue == 3, "status issue should be 3 not #{trans_issue.status_issue}" 
    assert trans_issue.qty == -12.0, "qty should be -12.0 not #{trans_issue.qty}"

    assert trans_receipt.status_receipt == 3, "status receipt should be 3 not #{trans_receipt.status_receipt}" 
    assert trans_receipt.qty == 12.0, "qty should be 12.0 not #{trans_receipt.qty}"
  end
end
