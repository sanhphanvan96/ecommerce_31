class CategoriesController < ApplicationController
  before_action :verify_admin, only: :new

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to products_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :description, :parent_id
  end
end
