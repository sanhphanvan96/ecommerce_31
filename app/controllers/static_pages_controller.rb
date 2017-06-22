class StaticPagesController < ApplicationController
  before_action :reset_cache

  def home
    @products = Product.all
    @products = Product.all.search_by_category(params[:search],
      params[:category_id])
    @products = @products.paginate(page: params[:page],
      per_page: Settings.max_product_per_page)
    respond_to do |f|
      f.html
      f.json
      f.js
    end
  end

  def about
  end
end
