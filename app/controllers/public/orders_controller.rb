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
  end

  def create
    @customer = current_customer

    redirect_to orders_complete_path
  end


  def confirm
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items
    @total = 0
    obj = order_params
    obj[:payment] = obj[:payment].to_i

    # to_iで文字を整数に変換
    # ラジオボタン０、１はenumで指定

    @order = Order.new(obj)
    # 支払い方法ではenum必要ない。クレカ、銀行払いなどの表示のみ必要

    

    if params[:order][:address_a] == "0"
      @order.post_address = current_customer.post_number
      @order.street_address = current_customer.street_address
      @order.address = current_customer.last_name + current_customer.first_name
      # 左側でorderのカラム　＝　右側でcustomerのカラム
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

  def order_params
    params.require(:order).permit(:payment, :address_a, :post_address, :street_address, :address, :order)
  end
# address_aはラジオボタン選択した際の番号を認識するため必要
# addressが宛名なので注意
end