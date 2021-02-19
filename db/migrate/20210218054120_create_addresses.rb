class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id #->customer_idへ変更済み
      t.string :address
      t.string :street_address
      t.string :post_address
      t.timestamps
    end
  end
end
