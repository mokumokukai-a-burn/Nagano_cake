class Public::OrdersController < ApplicationController

 
  def index
    @customer = Customer.find(params[:id])
    @customers = @customer.product
  end
    
  def new
  end
  
  def show
  end
  
  def create
  end
  
  def confirm
  end
  
  def complete
  end
  
end
