class Order < ApplicationRecord
  attr_accessor :cart

  has_many :order_details
  belongs_to :user
  validates :user_id, presence: true
  after_create :build_order_items

  scope :order_by_created_at, ->{order created_at: :desc}

  private

  def build_order_items
    cart.items.each do |item|
      order_details.create product_id: item.product_id, quantity: item.quantity
    end
  end
end
