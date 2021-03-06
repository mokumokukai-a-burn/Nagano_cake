class Admin::ProductsController < ApplicationController
before_action :authenticate_admin_admin!
  def new
    @product = Product.new
    @genres = Genre.all
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end


  def index
    @products = Product.all.page(params[:page]).per(8)
    @product = Product.new
    @quantity = Product.count
  end

  def show
     @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
  	@product.update(product_params)
  	redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :opinion, :image, :genre_id, :price, :is_active, :salesstatus)
  end

end
