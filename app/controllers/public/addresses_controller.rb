class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def create
    @customer = current_customer
    @address = Address.new(address_params)
    @address.customer_id = @customer.id
    @address.save
    redirect_to addresses_path
  end

  def index
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:address,:street_address,:post_address)
  end
end
