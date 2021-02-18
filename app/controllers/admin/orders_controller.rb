class Admin::OrdersController < ApplicationController
  def index
  end
  
  def show
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end
  
end
