class InventJournalLine < ActiveRecord::Base 
  attr_accessible :item_id, :dimension_id, :to_dimension_id, :journal_id, :qty, :type
  belongs_to :journal, class_name: "InventJournal", foreign_key: "journal_id"
  belongs_to :dimension, class_name: "InventDimension", foreign_key: "dimension_id"
  belongs_to :to_dimension, class_name: "InventDimension", foreign_key: "to_dimension_id"

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

  def invent_transactions
    # teruns inventory transactions for journal line
    # in case of transfer journals only issue or receipt transactions returned (dependind on @sign)

    if self.trans_qty > 0 then
      transes = InventTransaction.where(
        status_issue: 0,
        source_id: self.id,
        source_type: self.class.name)
    elsif self.trans_qty < 0 then
      transes = InventTransaction.where(
        status_receipt: 0,
        source_id: self.id,
        source_type: self.class.name)
    else
      transes = []
    end

    return transes
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

class InventJournalTransferLine < InventJournalLine
  belongs_to :journal, class_name: "InventJournalTransfer", foreign_key: "journal_id"

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
    InventUpdatePosted.transact self
    self.sign = 1
    InventUpdatePosted.transact self
  end  

  def transact_estimated
    self.sign = -1
    InventUpdateEstimated.transact self
    self.sign = 1
    InventUpdateEstimated.transact self
  end

end

class InventJournalCountLine < InventJournalLine
  belongs_to :journal, class_name: "InventJournalCount", foreign_key: "journal_id"

  def transact_estimated
    InventUpdateEstimated.transact self
  end

  def transact_posted
    InventUpdatePosted.transact self
  end
end