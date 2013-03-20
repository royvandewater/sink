class Sink.Router extends Backbone.Router
  initialize: =>
    @account = new Sink.Models.Account
    @account.fetch()

    @nav = new Sink.Models.Navigation account: @account
    @nav.on 'destroy', @redirectToLogin
    $('#navigation').html new Sink.Views.Navigation(model: @nav).render()

  routes:
    '': 'home'

  home: =>
    @view = new Sink.Views.Account model: @account
    $('#main').html @view.render()

  redirectToLogin: =>
    window.location.replace '/accounts/new'
