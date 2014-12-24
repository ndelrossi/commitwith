class App.Views.AppView extends Backbone.View
  template: JST['layout/index']

  initialize: ->
    @projectsView = new App.Views.Projects()

  render: ->
    @$el.html(@template())
    @$el.append(@projectsView.render().el)
    this
