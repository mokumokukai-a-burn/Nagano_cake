class Public::ProductsController < ApplicationController

  def index
    @products = Product.all.page(params[:page]).per(8)
    @product = Product.new
    @quantity = Product.count
  end

  def show
     @product = Product.find(params[:id])
  end
end
