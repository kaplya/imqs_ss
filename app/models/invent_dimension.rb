class InventDimension < ActiveRecord::Base
  attr_accessible :batch_id, :color_id, :location_id, :size_id

  has_many :transactions, class_name: "InventTransaction", foreign_key: "dimension_id"
end
