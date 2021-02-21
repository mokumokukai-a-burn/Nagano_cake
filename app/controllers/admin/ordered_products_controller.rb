class Admin::OrderedProductsController < ApplicationController
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order.id)
  end

  private
  def order_params
    params.require(:ordered_product).permit(:making_status)
  end
end
