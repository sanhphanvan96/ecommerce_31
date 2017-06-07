class Cart < ApplicationRecord
  has_many :products
  belongs_to :user
  validates :user_id, presence: true
end
