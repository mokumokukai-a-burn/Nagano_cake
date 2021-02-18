class Public::OrdersController < ApplicationController

  def index
    @customer = Customer.find(params[:id])
    @customers = @customer.product
  end

  def show
  end

end
