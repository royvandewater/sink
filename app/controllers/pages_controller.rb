class PagesController < ApplicationController
  def show
    redirect_to new_account_url unless current_user.present?
  end
end