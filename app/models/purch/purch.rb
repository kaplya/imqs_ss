module Purch
  class Purch < ActiveRecord::Base
    attr_accessible :description, :dimension_id, :number, :type
    has_many :lines, class_name: "PurchLine", foreign_key: "purch_id"
    set_table_name :purches
  end
end
