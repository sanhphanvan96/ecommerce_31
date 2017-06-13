class Product < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :product_categories
  has_many :categories, through: :product_categories
  validates :name, presence: true
  validates :price, presence: true
  mount_uploader :image, PictureUploader
  
  scope :search, -> name, category_id do
    search_by_name(name).
    search_by_category(category_id)
  end
  scope :search_by_name, ->name do
    where(["name LIKE ?", "%#{name}%"]) if name.present?
  end
  scope :search_by_category, ->category_id do
    where(["subcategory_id LIKE ?", "%#{category_id}%"]) if category_id.present?
  end
  scope :order_by_created_at, ->{order created_at: :desc}
  scope :join_category, -> do
    joins(:categories).
    select("products.*, categories.name AS category_name").
    order_by_created_at
  end
end
