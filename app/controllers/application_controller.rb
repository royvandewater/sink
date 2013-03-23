class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :with => :exception
  helper_method :current_account

  def current_account
    @current_account ||= Account.where(:rdio_key => session[:rdio_key]).first if session[:rdio_key]
  end
end
