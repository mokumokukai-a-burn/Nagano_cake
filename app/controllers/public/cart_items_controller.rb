class Public::CartItemsController < ApplicationController

  def index
    
    @cart_items = CartItem.all 
    
    
  end

  def create
    @cart_item = CartItem.new
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end
end
