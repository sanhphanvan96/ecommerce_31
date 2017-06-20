class Product < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :product_categories
  has_many :categories, through: :product_categories
  validates :name, presence: true
  validates :price, presence: true

  def self.search_by_category name, category_id
    if name.present?
      if category_id == "All categories"
        where(["name LIKE ?", "%#{name}%"])
      else
        where(["name LIKE ? AND subcategory_id LIKE ?", "%#{name}%", "%#{category_id}"])
      end
    else
      if category_id == "All categories"
        where(["name LIKE ?", "%#{name}%"])
      else
        where(["subcategory_id LIKE ?", "%#{category_id}"])
      end
    end
  end
end
