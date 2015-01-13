class App.Views.HomeView extends Backbone.View
  template: JST['layout/index']

  initialize: ->
    @projectsView = new App.Views.Projects(collection: @collection)

  render: ->
    @$el.html(@template())
    @projectsView.setElement(@$('.project-list')).render()
    this

  remove: ->
    @projectsView.remove(arguments...)
    super(arguments...)
