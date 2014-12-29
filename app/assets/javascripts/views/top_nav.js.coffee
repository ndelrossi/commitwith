class App.Views.TopNav extends Backbone.View
  template: JST['layout/top-nav']

  render: ->
    @$el.html(@template)
    this
