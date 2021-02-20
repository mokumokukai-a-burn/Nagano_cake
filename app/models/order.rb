class Order < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :ordered_products
  has_many :products, through: :ordered_products
  enum status: {
    入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4
  }



  accepts_nested_attributes_for :ordered_products, allow_destroy: true
  enum payment: {クレジットカード: 0, 銀行振り込み: 1 }
  # accepts_nested_attributes_for :ordered_products, allow_destroy: true
  # enum address_a: {ご自身の住所: 0, 登録済住所から選択: 1, 新しいお届け先: 2 }
  attr_accessor :address_a, :order
end