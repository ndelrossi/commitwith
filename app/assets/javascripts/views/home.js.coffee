class App.Views.HomeView extends Backbone.View
  template: JST['layout/index']

  initialize: ->
    @projectsNavView = new App.Views.ProjectsNav(collection: @collection)
    @projectsView = new App.Views.Projects(collection: @collection)

  render: ->
    @$el.html(@template())
    @projectsNavView.setElement(@$('.projects-nav')).render()
    @projectsView.setElement(@$('.projects-list')).render()
    this

  remove: ->
    @projectsNavView.remove(arguments...)
    @projectsView.remove(arguments...)
    super(arguments...)
