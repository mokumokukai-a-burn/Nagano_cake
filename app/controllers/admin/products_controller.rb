class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
    @genres = Genre.all
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    # byebug
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
    # obj = product_params
    # obj[:salesstatus] = obj[:salesstatus].to_i
    # @order = Order.new(obj)
    # @customer = Customer.find(params[:id])
    @product = Product.find(params[:id])
    # byebug
  	@product.update(product_params)
  # 	redirect_to admin_customer_path(@customer.id)
  	redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :opinion, :image, :genre_id, :price, :is_active, :salesstatus)
  end

end
