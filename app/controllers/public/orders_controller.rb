class Public::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @customer = current_customer
    @all = Product.all
    @address = Address.all
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
		@ordered_products = @order.ordered_products
  end

  def create
    @customer = current_customer
    obj = order_params
    obj[:payment] = obj[:payment].to_i
    @order = Order.new(obj)
    @order.customer_id = current_customer.id
    @order.save
    create_all_ordered_products(@order)
    redirect_to orders_complete_path
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    obj = address_params
    obj[:payment] = obj[:payment].to_i
    @order = Order.new(obj)
    if params[:order][:address_a] == "0"
      @order.post_address = current_customer.post_number
      @order.street_address = current_customer.street_address
      @order.address = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_a] == "1"
      @sta = params[:order][:order].to_i
      @order_address = Address.find(@sta)
      @order.post_address = @order_address.post_address
      @order.street_address  = @order_address.street_address
      @order.address  = @order_address.address
    elsif params[:order][:address_a] == "2"
      @order.post_address = params[:order][:post_address]
      @order.street_address = params[:order][:street_address]
      @order.address = params[:order][:address]
    end
  end

  def complete
  end

  def destroy_all
    @cart_items = current_customer.cart_items
		@cart_items.destroy_all
		redirect_to orders_complete_path
  end

  private

  def create_all_ordered_products(order)
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
     ordered_product = OrderedProduct.new
     ordered_product.order_id = order.id
     ordered_product.product_id = cart_item.product_id
     ordered_product.quantity = cart_item.quantity
     ordered_product.save
    end
    cart_items.destroy_all
  end


def order_params
  params.require(:order).permit(:post_address, :street_address, :address, :shipping_cost, :total_price, :payment, :status)
end


  def address_params
    params.require(:order).permit(:payment, :address_a, :post_address, :street_address, :address, :order)
  end
end