class Product < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :product_categories
  has_many :categories, through: :product_categories
  validates :name, presence: true
  validates :price, presence: true

  scope :search, -> search {where("name LIKE ?", "%#{search}%") if search.present?}
end
