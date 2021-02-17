class Admin::CustomersController < ApplicationController
  #before_action :authenticate_customer!
  #before_action :ensure_correct_customer, only: [:edit, :update, :destroy]
  def index
    @customers = Customer.all
    @admins = Admin.all
  end
  def show
  end
  def edit
  end
  def update
  end

  private

  #def customer_params
    #params.require(:book).permit(:title, :body)
  #end

  #def ensure_correct_customer
   #@book = Book.find(params[:id])
    #unless @book.user == current_user
      #redirect_to books_path
    #end
  #end
end
