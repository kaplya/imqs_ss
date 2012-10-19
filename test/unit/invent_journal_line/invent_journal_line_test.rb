module InventoryJournals
  require 'test_helper'

  class InventJournalLineTest < ActiveSupport::TestCase

    fixtures :invent_journals
    

    # test "validations" do 
    #   self.test_save_empty_line
    # end

    test "journal one" do
      journal = invent_journals(:one)

      assert !journal.nil?, "should find journal :one from fixtures"
    end

    def init_orphan_line
      line = InventJournalTransferLine.new( 
                                            item_id: 1, 
                                            type: "InventJournalLine"
                                            )
      return line
    end

    test "qty not numeric" do 
      line = init_orphan_line
      line.journal_id = 1
      line.qty = "blah"

      assert line.invalid?, "line should be invalid if value of qty is #{line.qty}"
    end

    test "save without journal" do
      line = init_orphan_line
      line.qty = 1

      assert line.invalid?, "line not referencing journal should be invalid"
    end

    test "wrong journal reference" do
      line = init_orphan_line
      line.qty = 1
      line.journal_id = 99

      assert line.invalid?, "should be invalid if references journal doesn't exist"
    end  


  end
end