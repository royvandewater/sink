class Sink.Models.Navigation extends Backbone.Model
  initialize: (options={}) =>
    @account = options.account
    @listenTo @account, 'change:username', @setUsername
    @setUsername()

  logout: =>
    @account?.logout()

  setUsername: (username) =>
    @set username: @account?.get 'username'
