module Purch
  class OrderLine < ActiveRecord::Base
    attr_accessible :amount, :dimension_id, :item_id, :order_id, :price, :qty, :type
    belongs_to :order, class_name: "Order", foreign_key: "order_id"
  end
end