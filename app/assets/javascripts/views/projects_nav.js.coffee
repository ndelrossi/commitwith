class App.Views.ProjectsNav extends Backbone.View
  template: JST['projects/projects-nav']

  render: ->
    @$el.html(@template())
    this
