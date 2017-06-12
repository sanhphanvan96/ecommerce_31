class Suggestion < ApplicationRecord
  belongs_to :user
  validates :user_id, presense: true
  validates :category_name, presense: true
  validates :product_name, presense: true
end
