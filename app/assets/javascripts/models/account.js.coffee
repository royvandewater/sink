class Sink.Models.Account extends Backbone.Model
  url: '/api/v1/account'  
  isNew: => false

  initialize: =>
    @on 'change:rdio_key', @onRdioKeyChange

  logout: =>
    @save {rdio_key: null}, wait: true

  onRdioKeyChange: =>
    @trigger 'logout' unless @get 'rdio_key'
