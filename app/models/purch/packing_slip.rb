module Purch
	class PackingSlip < ActiveRecord::Base
	  attr_accessible :description, :number, :purch_id, :type, :posted
	  has_many :lines, class_name: "PackingSlipLine", foreign_key: "slip_id"
	end
end