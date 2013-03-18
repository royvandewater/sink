class AccountsController < ApplicationController
  before_filter :find_account, :only => :show

  def create
    @account = Account.create!

    url = rdio.begin_authentication account_url @account
    @account.update_attributes :rdio_key => rdio.token[0], :rdio_secret => rdio.token[1]
    redirect_to url
  end

  def show
    if params[:oauth_verifier] && params[:oauth_token]
      rdio.complete_authentication params[:oauth_verifier]
      @account.update_attributes :rdio_key => rdio.token[0], :rdio_secret => rdio.token[1]
      session[:rdio_key] = @account.rdio_key
    end

    redirect_to root_url
  end

  protected
  def find_account
    @account = Account.where(:id => params[:id]).first
  end

  def rdio
    @rdio ||= Rdio.new(RDIO_TOKEN, @account.try(:rdio_token))
  end
end