class Sink.Router extends Backbone.Router
  initialize: =>
    @account = new Sink.Models.Account
    @listenTo @account, 'change:rdio_key', @routeAccount
    @account.fetch()

    @nav = new Sink.Models.Navigation account: @account
    $('#navigation').html new Sink.Views.Navigation(model: @nav).render()

  routes:
    '': 'home'
    'manage': 'manage'

  home: =>   $('#main').html new Sink.Views.Landing().render()
  manage: => $('#main').html new Sink.Views.Account(model: @account).render()

  routeAccount: =>
    if @account.get('rdio_key')
      Backbone.history.navigate 'manage', trigger: true
    else
      Backbone.history.navigate '', trigger: true
