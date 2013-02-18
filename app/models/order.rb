class Order < ActiveRecord::Base
  attr_accessible :item_id, :quantity, :customer_id
  belongs_to :customer
  belongs_to :item
end
