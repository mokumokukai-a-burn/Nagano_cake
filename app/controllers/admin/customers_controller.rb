class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin_admin!
  PER=10
  def index
    @customers = Customer.all
    @admins = Admin.all
    @customer_pages = Customer.page(params[:page]).per(PER)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "You have updated customer successfully."
    else
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:street_address,:post_number,:phone_number,:email,:is_deleted)
  end
end
