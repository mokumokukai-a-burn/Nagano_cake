class Product < ApplicationRecord
  belongs_to :genre
  attachment :image
  validates :is_active, inclusion: { in: [true, false] }
end
