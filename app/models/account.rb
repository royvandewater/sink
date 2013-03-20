class Account < ActiveRecord::Base
  validates_uniqueness_of :username, :if => :username


  def active?
    rdio_token.present?
  end
  alias_method :active, :active?

  def rdio_token
    [rdio_key, rdio_secret] if rdio_key && rdio_secret
  end

  def rdio
    @rdio ||= Rdio.new(RDIO_TOKEN, rdio_token)
  end
end
