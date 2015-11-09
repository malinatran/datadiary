class FitnessEntriesController < ApplicationController

  before_action :require_authentication

  def index
    @user = User.find(session[:user_id])
    if params[:search]
      @fitness_entries = FitnessEntry.search(params[:search]).order("date DESC")
    else
      @fitness_entries = FitnessEntry.all.order('date DESC')
    end
  end

  def show
    @fitness_entry = FitnessEntry.find(params[:id])
    @form_path = user_fitness_entry_path
  end

  def new
    @fitness_entry = FitnessEntry.new
    @form_path = user_fitness_entries_path
  end

  def create
    @fitness_entry = FitnessEntry.create(fitness_entry_params)
    @fitness_entry.user_id = session[:user_id]
    if @fitness_entry.save
      redirect_to user_fitness_entry_path(id: @fitness_entry.id, user_id: session[:user_id])
    else
      redirect_to :action => "index"
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @fitness_entry = FitnessEntry.find(params[:id])
    @form_path = user_fitness_entry_path
  end

  def update
    @fitness_entry = FitnessEntry.find(params[:id])
    @fitness_entry.update(fitness_entry_params)
    redirect_to user_fitness_entries_path(user_id: session[:user_id])
  end

  def destroy
    @fitness_entry = FitnessEntry.find(params[:id])
    @fitness_entry.destroy
    redirect_to :action => "index"
  end

  private

  def fitness_entry_params
    params.require(:fitness_entry).permit(:date, :duration, :notes)
  end

  def require_authentication
    if !session.has_key? :user_id
      redirect_to login_path
    end
  end

end
