class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def index
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
