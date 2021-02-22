class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_products
  has_many :products, through: :ordered_products
  enum status: {
    入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4
  }

  accepts_nested_attributes_for :ordered_products, allow_destroy: true
  enum payment: {クレジットカード: 0, 銀行振り込み: 1 }

  attr_accessor :address_a, :order
end