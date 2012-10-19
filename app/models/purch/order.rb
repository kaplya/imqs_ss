module Purch
  class Order < ActiveRecord::Base
  	attr_accessible :description, :number, :purch_id, :type, :posted
  	has_many :lines, class_name: "OrderLine", foreign_key: "order_id"
  end
end
