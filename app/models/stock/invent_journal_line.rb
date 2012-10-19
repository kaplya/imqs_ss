module Stock
  class StockJournalLine < ActiveRecord::Base 
    attr_accessible :item_id, :dimension_id, :to_dimension_id, :journal_id, :qty, :type
    belongs_to :journal, class_name: "StockJournal", foreign_key: "journal_id"

    validates :qty, numericality: true
    validates :item_id, presence: true
    validates :journal_id, presence: true
    validates_presence_of :journal

    after_create :transact_estimated
    after_update :transact_estimated


    @sign = 1
    attr_accessor :sign

    def init_trans trans
      trans.source_id = self.id
      trans.source_type = self.class.name

      trans.dimension_id = self.trans_dimension_id
      trans.item_id = self.trans_item_id
      trans.qty = self.trans_qty

      return trans
    end

    def source_hash
      ret = {}

      ret[:trans_dimension_id] = self.trans_dimension_id
      ret[:trans_item_id] = self.trans_item_id
      ret[:trans_qty] = self.trans_qty
      ret[:source_type] = self.class.name
      ret[:source_id] = self.id

      return ret
    end

    def invent_transactions
      # teruns inventory transactions for journal line
      # in case of transfer journals only issue or receipt transactions returned (dependind on @sign)

      return ::InventoryBasic::InventTransaction.abs_by_source source_hash
    end

    def trans_dimension_id
      self.dimension.dimension_id
    end

    def trans_item_id
      self.item_id
    end

    def trans_qty
      self.qty * @sign
    end

  end

  class StockJournalTransferLine < StockJournalLine
    belongs_to :journal, class_name: "StockJournalTransfer", foreign_key: "journal_id"

    validates :qty, numericality: {gteater_than: 0}


    def trans_dimension_id
      if (@sign > 0) then
        return self.to_dimension_id
      elsif (@sign < 0) then
        return self.dimension_id
      end
    end

    def transact_posted
      self.sign = -1
      ::InventoryBasic::InventUpdatePosted.transact source_hash
      self.sign = 1
      ::InventoryBasic::InventUpdatePosted.transact source_hash
    end  

    def transact_estimated
      self.sign = -1
      ::InventoryBasic::InventUpdateEstimated.transact source_hash
      self.sign = 1
      ::InventoryBasic::InventUpdateEstimated.transact source_hash
    end

  end

  class StockJournalCountLine < StockJournalLine
    belongs_to :journal, class_name: "InventJournalCount", foreign_key: "journal_id"

    def transact_estimated
      ::InventoryBasic::InventUpdateEstimated.transact source_hash
    end

    def transact_posted
      ::InventoryBasic::InventUpdatePosted.transact source_hash
    end
  end
end