class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :ordered_products
  has_many :orders, through: :ordered_products
  attachment :image
  validates :is_active, inclusion: { in: [true, false] }


  enum payment: {販売中: 0, 販売停止中: 1 }

  validates :name, presence: true
  validates :opinion, presence: true
  validates :price, presence: true
end