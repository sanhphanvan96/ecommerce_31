class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories
  has_many :ratings, dependent: :destroy
  has_many :subcategories, class_name: "Category", foreign_key: :parent_id
  has_one :parent, class_name: "Category", primary_key: :parent_id,
    foreign_key: :id
  accepts_nested_attributes_for :product_categories

  scope :main_categories, -> {where(parent_id: nil)}
  scope :sub_categories, -> {where.not(parent_id: nil)}
end
