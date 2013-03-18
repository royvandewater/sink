class AccountsController < ApplicationController
  def index
  end

  def create
    @account = Account.create!

    @rdio ||= Rdio.new([RDIO_KEY, RDIO_SECRET])
    url = @rdio.begin_authentication account_url @account

    rdio_token, rdio_secret = @rdio.token

    @account.update_attributes :rdio_token => rdio_token, :rdio_secret => rdio_secret

    redirect_to url
  end

  def show
    @account = Account.where(:id => params[:id]).first
    if params[:oauth_verifier] && params[:oauth_token]
      @rdio ||= Rdio.new([RDIO_KEY, RDIO_SECRET], [@account.rdio_token, @account.rdio_secret])
      @rdio.complete_authentication params[:oauth_verifier]

      rdio_token, rdio_secret = @rdio.token
      @account.update_attributes :rdio_token => rdio_token, :rdio_secret => rdio_secret
    end
  end

  protected
  def rdio
  end
end