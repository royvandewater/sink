class Sink.Views.Account extends Backbone.View
  template: JST['templates/account']

  initialize: =>
    @listenTo @model, 'change', @render

  events:
    'submit': 'onSubmit'

  context: =>
    _.defaults
      cid: @cid
      loading: @model.isLoading()
      , @model.toJSON()

  render: =>
    @$el.html @template @context()
    @$el

  onSubmit: ($event) =>
    $event.preventDefault()
    @model.save number_of_tracks_to_sync: @$('input.number-of-tracks').val()

