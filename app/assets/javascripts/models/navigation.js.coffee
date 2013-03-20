class Sink.Models.Navigation extends Backbone.Model
  initialize: (options={}) =>
    @account = options.account
    @listenTo @account, 'logout', @destroy

  logout: =>
    @account.logout()

  toJSON: =>
    _.extend @account.toJSON(), super
