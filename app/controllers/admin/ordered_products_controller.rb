class Admin::OrderedProductsController < ApplicationController
  before_action :authenticate_admin_admin!
  
  def update
    ordered_product = OrderedProduct.find(params[:id])
    ordered_product.update(ordered_product_params)
    redirect_to admin_order_path(ordered_product.order.id)
  end

  private
  def ordered_product_params
    params.require(:ordered_product).permit(:making_status)
  end
end