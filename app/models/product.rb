class Product < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :product_categories
  has_many :categories, through: :product_categories
  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :subcategory_id, presence: true
  mount_uploader :image, PictureUploader
  accepts_nested_attributes_for :product_categories

  scope :search_by_category, -> name, category_id {
    if name.present?
      if category_id.present?
        where(["name LIKE ? AND subcategory_id LIKE ?", "%#{name}%", "%#{category_id}%"])
      else
        where(["name LIKE ?", "%#{name}%"])
      end
    else
      if category_id.present?
        where(["subcategory_id LIKE ?", "%#{category_id}%"])
      else
        where(["name LIKE ?", "%#{name}%"])
      end
    end
  }

  scope :order_by_created_at, ->{order created_at: :desc}
  scope :join_category, ->{
    joins(:categories).
    select("products.*, categories.name AS category_name").
    order_by_created_at
  }
end
