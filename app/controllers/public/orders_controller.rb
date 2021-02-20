class Public::OrdersController < ApplicationController

  def index

    # @customer = Customer.find(params[:id])
    # @customers = @customer.product
    @orders = Order.all
    # @product = Product.find(params[:id])

  end



  def new
    @order = Order.new
    @customer = current_customer
    # @i = current_customer.cart_items
    @all = Product.all
    @address = Address.all
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @customer = current_customer
    # binding.pry
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end


  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    # bindiqng.pry
    obj = order_params
    obj[:payment] = obj[:payment].to_i
    # obj[:address] = obj[:address].to_i
    @order = Order.new(obj)
    # @order = Order.find(params[:id])

    # if params[:order][:address] == "1"
    #   @order.post_address = current_customer.postal_code
    #   @order.street_address = current_customer.street_address
    #   @order.address = current_customer.last_name+current_customer.first_name

      # @cart_items = current_customer.cart_items
      # @order.payment = params[:order][:payment]

    if params[:order][:address_a] == "0"
      @order.post_address = current_customer.post_number
      @order.street_address = current_customer.street_address
      @order.address = current_customer.last_name+ current_customer.first_name

    elsif params[:order][:address_a] == "1"
      # binding.pry
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
		# flash[:alert] = "カートの商品を全て削除しました"
		redirect_to orders_complete_path
 end

private

  def order_params
    params.require(:order).permit(:payment, :address_a, :post_address, :street_address, :address, :order)
  end


end