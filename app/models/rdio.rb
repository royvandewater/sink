class Rdio < SimpleRdio
  def username
    @username ||= current_user['username']
  end

  protected
  def call(method, arguments={})
    result = super
    result['result']
  end

  def current_user
    @current_user ||= call 'currentUser', :extras => 'username'
  end
end
