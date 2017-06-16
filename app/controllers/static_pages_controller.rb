class StaticPagesController < ApplicationController
  def home
    @products = Product.all
    @products = @products.search(params[:search]) if params[:search].present?
    @products = @products.paginate(:page => params[:page],
      :per_page => Settings.max_product_per_page)
  end

  def about
  end
end
