class App.Views.HomeView extends Backbone.View
  template: JST['layout/index']

  initialize: ->
    @topNavView = new App.Views.NavBar(collection: @collection)
    @projectsView = new App.Views.Projects(collection: @collection)

  render: ->
    @$el.html(@template())
    @$el.append(@topNavView.render().el)
    @$el.append(@projectsView.render().el)
    this
