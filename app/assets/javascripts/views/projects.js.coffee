class App.Views.Projects extends Backbone.View
  template: JST['projects/index']

  initialize: ->
    @navBar = new App.Views.NavBar()
    @listenTo(@collection, 'reset', @render)

  render: =>
    @$el.html(@navBar.render().el)
    @$el.append(@template())
    @collection.forEach(@renderProject)
    this

  renderProject: (project) =>
    view = new App.Views.ShowProject(model: project, tagName: 'tr')
    @$('.projects').append(view.render().el)
