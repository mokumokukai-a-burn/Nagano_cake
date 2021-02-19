class Admin::CustomersController < ApplicationController
  #before_action :authenticate_customer!
  #before_action :ensure_correct_customer, only: [:edit, :update, :destroy]
  def index
    @customers = Customer.all
    @admins = Admin.all
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

  #def ensure_correct_customer
   #@book = Book.find(params[:id])
    #unless @book.user == current_user
      #redirect_to books_path
    #end
  #end
end
