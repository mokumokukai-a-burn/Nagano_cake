class AddMakingStatusToOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :ordered_products, :making_status, :integer, null: false, default:0
  end
end
