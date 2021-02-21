class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :payment
      t.string :post_address
      t.string :street_address
      t.string :address
      t.integer :shipping_cost
      t.integer :status
      t.integer :total_price
      t.timestamps
    end
  end
end
