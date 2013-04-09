class PagesController < ApplicationController
  def landing
  end
  
  def show
    redirect_to new_account_url unless current_account.present?
  end
end
