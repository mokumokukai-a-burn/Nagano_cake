class Public::OrdersController < ApplicationController

 
  def index
    @orders = Order.all
  end
    
  def new
  end
  
  def show
    @order = Order.find(params[])
  end
  
  def create
  end
  
  def confirm
  end
  
  def complete
  end
  
end
