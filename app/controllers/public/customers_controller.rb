class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end
  def edit
    @customer = current_customer
  end
  def update
    @customer = current_customer
    if @customer.update(public_customer_params)
      redirect_to customer_path(@customer), notice: "You have updated customer successfully."
    else
      render "edit"
    end
  end
  def unsubscrive
    @customer = current_customer
  end
  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    redirect_to "/"
  end
end

private

  def public_customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:street_address,:post_number,:phone_number,:email,)
  end