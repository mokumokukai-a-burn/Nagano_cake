class Public::OrdersController < ApplicationController


  def index
    @customer = Customer.find(params[:id])
    @customers = @customer.product
    # @orders = Order.all
    @product = Product.find(params[:id])
  end

  def new
    @order = Order.new
    @customer = current_customer
    # @i = current_customer.cart_items
    @all = Product.all
    @address = Address.all
  end

  def show
  end

  def create
    @customer = current_customer
    # binding.pry
    # params[:payment][:address] = params[:payment][:address].to_i
    @order = Order.new(order_params)
    @order.save
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    # @order = Order.find(params[:id])

  end

  def complete
  end

private

  def order_params
    params.require(:order).permit(:payment, :address)


  end


end
