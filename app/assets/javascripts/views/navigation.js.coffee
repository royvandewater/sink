class Sink.Views.Navigation extends Backbone.View
  template: JST['templates/navigation']

  events:
    'submit .logout': 'onLogout'

  render: =>
    @$el.html @template @model.toJSON()

  onLogout: ($event) =>
    $event.preventDefault()
    @model.logout()
