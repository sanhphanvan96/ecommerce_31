class ProductsController < ApplicationController
  before_action :verify_admin, except: :show
  before_action :reset_cache
  before_action :load_product, only: [:show, :new]

  def index
    @products = Product.all
    @products = Product.all.search_by_category(params[:search],
      params[:category_id])
    @products = @products.paginate(:page => params[:page],
      :per_page => Settings.max_product_per_page)
    respond_to do |f|
      f.html
      f.json
      f.js
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  private

  def reset_cache
    :reset_cache
  end
end
