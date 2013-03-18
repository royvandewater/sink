class Account < ActiveRecord::Base
  def rdio
    @rdio ||= Rdio.new([RDIO_KEY,RDIO_SECRET], [rdio_token, rdio_secret])
  end
end
