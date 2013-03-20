class Sink.Router extends Backbone.Router
  initialize: =>
    @nav = new Sink.Models.Navigation
    @nav.on 'destroy', @redirectToLogin
    $('#navigation').html new Sink.Views.Navigation(model: @nav).render()

  routes:
    '': 'home'

  home: =>

  redirectToLogin: =>
    window.location.replace '/accounts/new'
