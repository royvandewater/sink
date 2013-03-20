class Sink.Models.Navigation extends Backbone.Model
  initialize: =>
    @account = new Sink.Models.Account
    @listenTo @account, 'logout', @destroy

  logout: =>
    @account.logout()

  toJSON: =>
    _.extend @account.toJSON(), super
