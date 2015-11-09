class MenstruationEntriesController < ApplicationController

  before_action :require_authentication

  def index
    @user = User.find(session[:user_id])
    if params[:search]
      @menstruation_entries = MenstruationEntry.search(params[:search]).order("start_date DESC")
    else
      @menstruation_entries = MenstruationEntry.all.order('start_date DESC')
    end
  end

  def show
    @menstruation_entry = MenstruationEntry.find(params[:id])
    @form_path = user_menstruation_entry_path
  end

  def new
    @menstruation_entry = MenstruationEntry.new
    @form_path = user_menstruation_entries_path
  end

  def create
    @menstruation_entry = MenstruationEntry.create(menstruation_entry_params)
    @menstruation_entry.user_id = session[:user_id]
    if @menstruation_entry.save
      redirect_to user_menstruation_entry_path(id: @menstruation_entry.id, user_id: session[:user_id])
    else
      redirect_to :action => "index"
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @menstruation_entry = MenstruationEntry.find(params[:id])
    @form_path = user_menstruation_entry_path
  end

  def update
    @menstruation_entry = MenstruationEntry.find(params[:id])
    @menstruation_entry.update(menstruation_entry_params)
    redirect_to user_menstruation_entries_path(user_id: session[:user_id])
  end

  def destroy
    @menstruation_entry = MenstruationEntry.find(params[:id])
    @menstruation_entry.destroy
    redirect_to :action => "index"
  end

  private

  def menstruation_entry_params
    params.require(:menstruation_entry).permit(:start_date, :end_date, :notes)
  end

  def require_authentication
    if !session.has_key? :user_id
      redirect_to login_path
    end
  end

end
