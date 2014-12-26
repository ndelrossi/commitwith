class App.Views.LeftNavLinks extends Backbone.View
  template: JST['layout/left-nav-links']

  render: ->
    @$el.html(@template)
    this
