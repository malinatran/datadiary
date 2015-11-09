class MiscellaneousController < ApplicationController

  def index
    @home_page = true
    if session[:user_id]
      redirect_to '/dashboard'
    end
  end

  def dashboard
    @user = User.find(session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
