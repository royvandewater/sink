class Sink.Views.Navigation extends Backbone.View
  template: JST['templates/navigation']

  initialize: =>
    @listenTo @model, 'change', @render

  events:
    'submit .logout': 'onLogout'

  render: =>
    @$el.html @template @model.toJSON()

  onLogout: ($event) =>
    $event.preventDefault()
    @model.logout()

