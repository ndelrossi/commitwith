class App.Views.Projects extends Backbone.View
  template: JST['projects/index']

  initialize: ->
    @allProjects = new App.Collections.Projects()
    @allProjects.fetch()
    @listenTo(@allProjects, 'add', @render)
    @listenTo(@allProjects, 'reset', @render)

  render: =>
    @$el.html(@template())
    @allProjects.forEach(@renderProject)
    this

  renderProject: (project) =>
    view = new App.Views.ShowProject(model: project, tagName: 'tr')
    @$('.projects').append(view.render().el)
