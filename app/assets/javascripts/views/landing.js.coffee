class Sink.Views.Landing extends Backbone.View
  template: JST['templates/landing']
  render: =>
    @$el.html @template()
