class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = @products.search(params[:search]) if params[:search].present?
    @products = @products.paginate(:page => params[:page],
      :per_page => Settings.max_product_per_page)
    @categories = Category.includes(:subcategories)
  end

  def show
  end

  def new
    @product = Product.new
  end

  private

end
