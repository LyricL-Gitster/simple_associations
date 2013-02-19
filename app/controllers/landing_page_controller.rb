class LandingPageController < ApplicationController
  def home
  	@customers = Customer.all
  	@orders = Order.all
  end
end