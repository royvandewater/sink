class Api::V1::ApiController < ApplicationController
  protect_from_forgery :with => :null_session
  respond_to :json
  before_filter :require_current_account

  protected
  def require_current_account
    head :forbidden, :location => new_account_url unless current_account.present?
  end
end
