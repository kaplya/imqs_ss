module Stock
  class StockJournal < ActiveRecord::Base
    attr_accessible :description, :dimension_id, :number, :to_dimension_id, :type, :posted
    has_many :lines, class_name: "StockJournalLine", foreign_key: "journal_id"

    validates :number, presence: true
    validates :dimension_id, presence: true

    def post
      self.transaction do 
        
        raise "Stock Journal #{self.number} is already posted!" if self.posted    

        self.lines.each do |line| 
          line.transact_posted
        end

        self.posted = true
        self.save
      end
    end
  end

  class StockJournalTransfer < StockJournal
    has_many :lines, class_name: "StockJournalTransferLine", foreign_key: "journal_id"
    validates :to_dimension_id, presence: true
  end


  class StockJournalCount < StockJournal
    has_many :lines, class_name: "StockJournalCountLine", foreign_key: "journal_id"
    
  end
end