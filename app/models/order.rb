class Order < ApplicationRecord
  belongs_to :customer
  has_many :products, through: :ordered_products
  enum order:{
    クレジットカード: 0,
    銀行振り込み:1
  }
  
  def full_name
    self.last_name + self.first_name
  end

end