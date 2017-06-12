class OrderDetail < ApplicationRecord
  has_many :products
  belongs_to :order
  validates :user_id, presense: true
  validates :product_id, presense: true
end
