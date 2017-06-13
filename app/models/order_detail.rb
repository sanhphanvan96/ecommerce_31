class OrderDetail < ApplicationRecord
  has_many :products
  belongs_to :order
  validates :user_id, presence: true
  validates :product_id, presence: true
end
