class ProductsController < ApplicationController
  before_action :verify_admin, except: :show
  before_action :reset_cache
  before_action :load_product, only: [:show, :new]

  def index
    @products = Product.joins(:categories).select("products.*,
      categories.name as category_name").order_by_created_at
  end

  def show
  end

  def new
    @product = Product.new
  end

  private

end
