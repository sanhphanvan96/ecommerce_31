class Product < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :product_categories
  has_many :categories, through: :product_categories
  validates :name, presence: true
  validates :price, presence: true
  def self.search(search)

    if search
      self.where("name like ?", "%#{search}%")
    else
      self.all
    end
  end
end
