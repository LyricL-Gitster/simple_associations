class OrdersController < ApplicationController
  before_filter :convert_customer_name_to_id, only: [:create,:update]

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  def index
    @customer = Customer.find(params[:customer_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Customer.find(params[:customer_id]).orders.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to customer_order_path(@order.customer,@order), notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to customer_order_path(@order.customer,@order), notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
      def convert_customer_name_to_id
        customer = Customer.find_by_name(params[:order].delete(:customer_name))
        params[:order].merge!({customer_id: customer.id}) unless customer.nil?
      end
end
