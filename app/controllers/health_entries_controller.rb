class HealthEntriesController < ApplicationController
  before_action :require_authentication

  def index
    @user = User.find(session[:user_id])
    if params[:search]
      @health_entries = HealthEntry.search(params[:search]).order("date DESC")
    else
      @health_entries = HealthEntry.all.order('date DESC')
    end
  end

  def show
    @health_entry = HealthEntry.find(params[:id])
    @form_path = user_health_entry_path
  end

  def new
    @health_entry = HealthEntry.new
    @form_path = user_health_entries_path
  end

  def create
    @health_entry = HealthEntry.create(health_entry_params)
    @health_entry.user_id = session[:user_id]
    if @health_entry.save
      redirect_to user_health_entry_path(id: @health_entry.id, user_id: session[:user_id])
    else
      redirect_to :action => "index"
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @health_entry = HealthEntry.find(params[:id])
    @form_path = user_health_entry_path
  end

  def update
    @health_entry = HealthEntry.find(params[:id])
    @health_entry.update(health_entry_params)
    redirect_to user_health_entries_path(user_id: session[:user_id])
  end

  def destroy
    @health_entry = HealthEntry.find(params[:id])
    @health_entry.destroy
    redirect_to :action => "index"
  end

  private

  def health_entry_params
    params.require(:health_entry).permit(:date, :emotion, :notes)
  end

  def require_authentication
    if !session.has_key? :user_id
      redirect_to login_path
    end
  end

end
