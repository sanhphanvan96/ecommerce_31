class Order < ApplicationRecord
  has_many :order_details
  belongs_to :user
  validates :user_id, presense: true
  validates :content, presense: true
end
