class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_products
  has_many :products, through: :ordered_products
  accepts_nested_attributes_for :ordered_products, allow_destroy: true
  enum order:{
    クレジットカード: 0,
    銀行振り込み:1
  }
end