class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category
  validates :category_id, presense: true
  validates :product_id, presense: true
end
