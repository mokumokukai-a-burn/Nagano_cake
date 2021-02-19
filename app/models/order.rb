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

  accepts_nested_attributes_for :ordered_products, allow_destroy: true
  enum payment: {クレジットカード: 0, 銀行振り込み:1 }
  enum address: {ご自身の: 1, 登録済み住所から選択:2, 新しいお届け先:3 }
end