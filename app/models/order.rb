class Order < ApplicationRecord
  has_many :order_details
  belongs_to :user
  validates :user_id, presence: true
end
