class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
    @genres = Genre.all
    @products = Product.all
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to root_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :opinion, :image, :genre_id, :price, :is_active)
  end


  def index
    @products = Product.all.page(params[:page]).per(8)
    @product = Product.new
    @quantity = Product.count
  end

  def show
     @product = Product.find(params[:id])
  end
  
end
