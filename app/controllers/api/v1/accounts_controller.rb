class Api::V1::AccountsController < Api::V1::ApiController
  def show
    respond_with current_account
  end

  def update
    current_account.update_attributes account_params
    current_account.sync! if params[:sync]
    respond_with current_account
  end

  protected
  def account_params
    params.permit :rdio_key, :number_of_tracks_to_sync
  end
end
