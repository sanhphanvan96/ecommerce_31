class ProductsController < ApplicationController
  before_action :verify_admin, except: :show
  before_action :reset_cache
  before_action :load_product, except: [:create, :index, :new]

  def index
    @products = Product.join_category.paginate(page: params[:page],
      per_page: Settings.max_product_per_table)
  end

  def show
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "success.product_created"
      redirect_to @product
    else
      render :new
    end
  end

  def update
    if @product.update_attributes(product_params)
      flash[:success] = t "success.product_updated"
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:success] = t "success.product_deleted"
    redirect_to products_url
  end

  private

  def product_params
    params.require(:product).permit :name, :price, :description, :image, product_categories_attributes:
      [:id, :category_id]
  end
end
