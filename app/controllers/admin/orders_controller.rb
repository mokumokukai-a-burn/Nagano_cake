class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin_admin!
  PER=10
  def index
    @orders = Order.all
    @order_pages = Order.page(params[:page]).per(PER)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order.id)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end