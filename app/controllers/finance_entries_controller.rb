class FinanceEntriesController < ApplicationController
  before_action :require_authentication

  def index
    @user = User.find(session[:user_id])
    if params[:search]
      @finance_entries = FinanceEntry.search(params[:search]).order("date DESC")
    else
      @finance_entries = FinanceEntry.all.order('date DESC')
    end
  end

  def show
    @finance_entry = FinanceEntry.find(params[:id])
    @form_path = user_finance_entry_path
  end

  def new
    @finance_entry = FinanceEntry.new
    @form_path = user_finance_entries_path
  end

  def create
    @finance_entry = FinanceEntry.create(finance_entry_params)
    @finance_entry.user_id = session[:user_id]
    if @finance_entry.save
      redirect_to user_finance_entry_path(id: @finance_entry.id, user_id: session[:user_id])
    else
      redirect_to :action => "index"
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @finance_entry = FinanceEntry.find(params[:id])
    @form_path = user_finance_entry_path
  end

  def update
    @finance_entry = FinanceEntry.find(params[:id])
    @finance_entry.update(finance_entry_params)
    redirect_to user_finance_entries_path(user_id: session[:user_id])
  end

  def destroy
    @finance_entry = FinanceEntry.find(params[:id])
    @finance_entry.destroy
    redirect_to :action => "index"
  end

  private

  def finance_entry_params
    params.require(:finance_entry).permit(:date, :expense, :notes, :category)
  end

  def require_authentication
    if !session.has_key? :user_id
      redirect_to login_path
    end
  end

end
