class ProductsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page],
      :per_page => Settings.max_product_per_pages)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  private

end
