class StaticPagesController < ApplicationController
  def home
    @products = Product.all
    @products = @products.search(params[:search])
    @products = @products.paginate(page: params[:page],
      per_page: Settings.max_product_per_page)
  end

  def about
  end
end
