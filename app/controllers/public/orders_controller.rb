class Public::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @customer = current_customer
    @i = current_customer.cart_items
    @all = Product.all
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @customer = current_customer
    order = Order.new(order_params)
    order.save!
    redirect_to orders_path
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.find(params[:id])
  end

  def complete
  end

private

  def order_params
    params.require(:order).permit(:payment, :address, :street_address, :post_address, :street_address, :address)
  end


end