class Public::OrdersController < ApplicationController


  def index
    @customer = Customer.find(params[:id])
    @customers = @customer.product
    # @orders = Order.all
  end

  def new
    @customer = current_customer
    @i = current_customer.cart_items
    @all = Product.all

  end

  def show
  end

  def create
    @customer = current_customer
    @order = Order.new(order_params)
    @order.save

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
    @payment =
    params.permit(:payment, :address)

  end


end
