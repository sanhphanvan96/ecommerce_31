class Product < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :product_categories
  has_many :categories, through: :product_categories
  validates :name, presense: true
  validates :price, presense: true
end
