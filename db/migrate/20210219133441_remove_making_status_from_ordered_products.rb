class RemoveMakingStatusFromOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :ordered_products, :making_status, :integer
  end
end
