class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  attachment :image 
  validates :is_active, inclusion: { in: [true, false] }
 
  has_many :cart_items
  
  attachment :image
end
