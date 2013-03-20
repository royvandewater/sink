class Sink.Views.Account extends Backbone.View
  template: JST['templates/account']

  initialize: =>
    # @tracks = @model.syncedTracks()
    @listenTo @model, 'change', @render

  render: =>
    @$el.html @template @model.toJSON()
    # @$el.append new Sink.Views.Tracks(collection: @tracks).render()
    @$el
