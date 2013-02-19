class Customer < ActiveRecord::Base
  attr_accessible :contact, :name, :phone
  has_many :orders
  has_many :items, through: :orders
  validates :name, :presence=> true
  validates :contact, :presence=> true
  validates :phone, :presence=> true
end
