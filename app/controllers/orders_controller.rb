class OrdersController < ApplicationController
  before_action :logged_in_user
  before_action :load_user, except: [:create, :index, :new]
  before_action :load_product, only: [:show]
  before_action :load_cart, only: [:new, :create]

  def index
    @orders = current_user.orders.paginate page: params[:page],
      per_page: Settings.max_product_order_per_page
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new order_params
    if @order.save
      OrderMailer.confirm_order(@order, current_user).deliver
      session.delete("cart")
      flash[:success] = t "success.order_created"
      redirect_to order_path @order
    else
      redirect_to new_order_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:infor)
      .merge! user: current_user, total_payment: @cart.total_price, cart: @cart
  end
end
