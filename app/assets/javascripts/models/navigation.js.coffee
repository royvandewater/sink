class Sink.Models.Navigation extends Backbone.Model
  initialize: (options={}) =>
    @account = options.account
    @listenTo @account, 'change', @setUsername
    @setUsername()

  logout: =>
    @account?.logout()

  setUsername: (username) =>
    if @account.get 'rdio_key'
      @set username: @account?.get 'username'
    else
      @unset 'username'
