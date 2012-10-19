module Purch
  class PurchLine < ActiveRecord::Base
  	attr_accessible :dimension_id, :item_id, :purch_id, :qty, :type, :price, :amount
  	belongs_to :purch, class_name: "Purch", foreign_key: "purch_id"
  	set_table_name :purch_lines
  end
end