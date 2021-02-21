class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :ordered_products
  has_many :orders, through: :ordered_products
  attachment :image
  validates :is_active, inclusion: { in: [true, false] }
  attachment :image

  enum payment: {販売中: 0, 販売停止中: 1 }
end