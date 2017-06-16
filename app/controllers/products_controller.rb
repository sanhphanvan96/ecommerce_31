class ProductsController < ApplicationController
  def index
  @products = Product.all
  # Patching all Listing
  @product = Product.where(id: params[:id]) if params[:id].present?
  # Find By Id (For pagination, the 'where' statement result is Product ActiveRecord::Relationship )
  @products = @products.search(params[:search]) if params[:search].present?
  # Search using Keyword
  @products = @products.paginate(:page => params[:page], :per_page => 10)
  # Pagination
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  private

end
