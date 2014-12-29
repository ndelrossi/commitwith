class App.Views.Welcome extends Backbone.View
  template: JST['layout/welcome']

  render: ->
    @$el.html(@template)
