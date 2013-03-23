class Sink.Models.Account extends Backbone.Model
  url: '/api/v1/account'  
  isNew: => false

  initialize: =>
    @on 'change:rdio_key', @onRdioKeyChange
    @on 'request', => @set 'loading', true
    @on 'sync', => @set 'loading', false

  toJSON: =>
    _.omit super, 'loading'

  isLoading: =>
    @get 'loading'

  logout: =>
    @save {rdio_key: null}, wait: true

  onRdioKeyChange: =>
    @trigger 'logout' unless @get 'rdio_key'

