class Rdio < SimpleRdio
  def username
    @username ||= currentUser['username']
  end

  def currentUser
    return @currentUser if @currentUser
    response = call 'currentUser', :extras => 'username'
    @currentUser = response['result']
  end
end