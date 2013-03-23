class Sink.Views.Account extends Backbone.View
  template: JST['templates/account']

  initialize: =>
    @listenTo @model, 'change', @render

  render: =>
    @$el.html @template @model.toJSON()
    @$el
