class App.Views.SideNav extends Backbone.View
  template: JST['layout/side-nav']

  render: ->
    @$el.html(@template)
    this

