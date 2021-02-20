class Public::CartItemsController < ApplicationController


  def index
    @cart_items = current_customer.cart_items
    @total = 0

  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    # byebug
    # binding.pry
    if @cart_item.save
      flash[:notice] = "カートに追加しました"
      redirect_to cart_items_path
    else
      @product = Product.find(params[:cart_item][:product_id])
      flash[:alert] = "error"
      render "public/products/show"
    end
  end


  def update
    @cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
		@cart_items.destroy_all
		flash[:alert] = "カートの商品を全て削除しました"
		redirect_to cart_items_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:customer_id, :product_id, :quantity, :postal_code, :shipping_address, :name)
    end
end
