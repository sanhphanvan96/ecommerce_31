class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :load_category
  before_action :load_product, only: [:show, :new]

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "error.user.no_login"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless current_user?(@user) || current_user.is_admin?
  end

  def verify_admin
    redirect_to(root_url) unless current_user.is_admin?
  end

  private

  def load_category
    @categories = Category.includes(:subcategories)
  end

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "error.product.not_found"
    redirect_to root_path
  end
end
