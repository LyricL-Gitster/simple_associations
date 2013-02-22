class LandingPageController < ApplicationController
  def home
  	@customers = Customer.order("name ASC")
  	@orders = Order.order("created_at DESC")
  end
end