class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_products
  has_many :products, through: :ordered_products
  accepts_nested_attributes_for :ordered_products, allow_destroy: true
  enum payment: {クレジットカード: 0, 銀行振り込み:1 }
  enum address: {ご自身の: 1, 登録済み住所から選択:2, 新しいお届け先:3 }
end