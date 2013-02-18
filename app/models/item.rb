class Item < ActiveRecord::Base
  attr_accessible :cost, :name
  has_many :customers, through: :orders
  has_many :orders
end
