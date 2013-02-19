include ActionView::Helpers::NumberHelper

class Order < ActiveRecord::Base
  attr_accessible :item_id, :quantity, :customer_id, :customer_name
  belongs_to :customer
  belongs_to :item
  validates :customer_id, :presence=>
  			{ :message=>"name must be provided" }
  validates :item_id, :presence=>
        { :message=>"must be selected" }
  validates :quantity, :presence=> true

  def total_cost
  	number_to_currency(self.item.cost * self.quantity, :unit => "$")
  end

  def customer_name
  	self.customer.name unless self.customer.nil?
  end
end
