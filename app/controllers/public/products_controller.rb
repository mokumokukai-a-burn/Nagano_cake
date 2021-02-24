class Public::ProductsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]

  def index
    @products = Product.where(is_active: 'true').page(params[:page]).per(8)
    @product_all = Product.where(is_active: 'true').count
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
     @cart_item = CartItem.new
  end
end
