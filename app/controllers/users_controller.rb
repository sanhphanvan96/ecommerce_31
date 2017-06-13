class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :destroy, :update]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :admin_user, only: [:index, :destroy]

  def index
    @users = User.all.paginate(page: params[:page],
      per_page: Settings.max_user_per_table)
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "error.user.not_found"
    redirect_to root_path
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
    @user = User.find_by id: params[:id]
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update_attributes(user_params)
      flash[:success] = t "success.profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:success] = t "success.user_deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :phone, :address
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "error.user.no_login"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless (current_user?(@user) || current_user.is_admin?)
  end

  def admin_user
    redirect_to(root_url) unless current_user.is_admin?
  end
end
