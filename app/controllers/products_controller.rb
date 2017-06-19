class ProductsController < ApplicationController
  before_action :load_product, only: [:show, :new]
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

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "error.product.not_found"
    redirect_to root_path
  end
end
