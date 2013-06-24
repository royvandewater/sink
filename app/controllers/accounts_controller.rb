class AccountsController < ApplicationController
  before_filter :find_account, :only => [:show, :update]
  layout false

  def create
    @account = Account.create!

    url = rdio.begin_authentication account_url @account
    @account.update_attributes :rdio_key => rdio.token[0], :rdio_secret => rdio.token[1]
    redirect_to url
  end

  def show
    if params[:oauth_verifier] && params[:oauth_token]
      rdio.complete_authentication params[:oauth_verifier]

      @old_account = Account.where(:username => rdio.username).first
      if @old_account
        @account.destroy
        @account = @old_account
      end

      @account.update_attributes({
        :rdio_key    => rdio.token[0],
        :rdio_secret => rdio.token[1],
        :username    => rdio.username,
      })

      session[:session_token] = @account.session_token
    end

    redirect_to root_url
  end

  protected
  def find_account
    @account = Account.where(:id => params[:id]).first
  end

  def rdio
    @rdio ||= @account.try(:rdio) || Rdio.new(RDIO_TOKEN)
  end

  def account_params
    params.require(:account).permit :rdio_key
  end
end
