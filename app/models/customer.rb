class Customer < ActiveRecord::Base
  attr_accessible :contact, :name, :phone
  has_many :orders
  has_many :items, through: :orders
end
