module Purch
	class PackingSlipLine < ActiveRecord::Base
	  attr_accessible :amount, :dimension_id, :item_id, :price, :qty, :slip_id, :type
	  belongs_to :slip, class_name: "PackingSlip", foreign_key: "slip_id"
	end
end
