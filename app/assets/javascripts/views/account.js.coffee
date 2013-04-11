class Sink.Views.Account extends Backbone.View
  template: JST['templates/account']

  initialize: =>
    @listenTo @model, 'change', @render

  events:
    'click .sync': 'onClickSync'
    'submit':      'onSubmit'

  context: =>
    _.defaults
      cid: @cid
      , @model.toJSON()

  render: =>
    @$el.html @template @context()
    @$('select.sync-type').val @model.get 'sync_type'
    @$el

  updateModel: =>
    @model.set 
      auto_sync:                @$('input.auto-sync').prop('checked')
      number_of_tracks_to_sync: @$('input.number-of-tracks').val()
      sync_type:                @$('select.sync-type').val()

  onClickSync: ($event) =>
    $event.preventDefault()
    @updateModel()
    if confirm 'Are you sure? \n\nMake sure you read the warning at the bottom of the page.'
      @model.save sync: true

  onSubmit: ($event) =>
    $event.preventDefault()
    @updateModel()
    @model.save sync: false

