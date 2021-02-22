class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :price
      t.integer :quantity
      t.integer :making_status, default: 0
      t.timestamps
    end
  end
end
