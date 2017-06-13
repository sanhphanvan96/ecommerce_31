class UsersController < ApplicationController
  before_action :logged_in_user, except: [:create, :show, :new]
  before_action :correct_user, except: [:create, :index, :new]
  before_action :verify_admin, only: :index
  before_action :load_user, except: [:create, :index, :new]

  def index
    @users = User.order_by_created_at.paginate(page: params[:page],
      per_page: Settings.max_user_per_table)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "success.welcome"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = t "success.profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "success.user_deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :phone, :address
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "error.user.not_found"
    redirect_to root_path
  end
end
