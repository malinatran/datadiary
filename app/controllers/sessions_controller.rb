class SessionsController < ApplicationController

  def new
    @home_page = true
  end

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user && @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      redirect_to '/'
    end
  end

  def destroy
    reset_session
    redirect_to '/', notice: "You have successfully logged out."
  end

end
