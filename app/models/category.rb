class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories
  has_many :subcategories, :class_name => "Category", :foreign_key => :parent_id
  has_one :parent, :class_name => "Category", :primary_key => :parent_id, :foreign_key => :id
end
