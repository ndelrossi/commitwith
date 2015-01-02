class App.Views.Projects extends Backbone.View
  template: JST['projects/index']

  initialize: ->
    @listenTo(@collection, 'add', @render)
    @listenTo(@collection, 'reset', @render)
    @listenTo(@collection, 'change', @render)

  render: =>
    @$el.html(@template())
    @collection.forEach(@renderProject)
    this

  renderProject: (project) =>
    view = new App.Views.ShowProject(model: project)
    @$('.projects').append(view.render().el)
