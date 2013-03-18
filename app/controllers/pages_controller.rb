class PagesController < ApplicationController
  before_filter :find_account

  def show
    redirect_to new_account_url unless @account.present?
  end

  protected
  def find_account
    @account = Account.where(:rdio_key => session[:rdio_key]).first
  end
end