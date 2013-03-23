class Api::V1::AccountsController < Api::V1::ApiController
  def show
    respond_with current_account
  end

  def update
    respond_with current_account.update_attributes account_params
  end

  protected
  def account_params
    params.permit :rdio_key, :songs_to_sync
  end
end
