class UsersController < ApplicationController

  def new
    @user = User.new
    @form_path = register_path
    @home_page = true
  end

  def create
    @user = User.create(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to '/dashboard'
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(session[:user_id])
    @form_path = settings_path
  end

  def update
    User.update(session[:user_id], user_params)
    redirect_to '/dashboard'
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :email, :username, :password)
  end

end
