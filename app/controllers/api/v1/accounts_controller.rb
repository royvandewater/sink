class Api::V1::AccountsController < ApplicationController
  respond_to :json

  def show
    respond_with current_user
  end

  def update
    respond_with current_user.update_attributes account_params
  end

  protected
  def account_params
    params.permit :rdio_key
  end
end
