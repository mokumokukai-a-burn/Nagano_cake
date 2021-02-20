class AddPaymentToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment, :integer, null: false, default: 0
  end
end
