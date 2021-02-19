class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @order_kaminari = Order.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @orders = @order.orders
  end

end