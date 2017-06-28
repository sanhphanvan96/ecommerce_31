class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :product_id, presence: true

  def total_price
    product.price * quantity
  end
end
