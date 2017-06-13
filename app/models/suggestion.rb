class Suggestion < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :category_name, presence: true
  validates :product_name, presence: true
end
