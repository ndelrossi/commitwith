class App.Views.Projects extends Backbone.View
  template: JST['projects/index']

  initialize: ->
    @navBar = new App.Views.NavBar()
    @addActions = new App.Views.AddActions(collection: @collection)
    @listenTo(@collection, 'reset', @render)
    @listenTo(@collection, 'add', @renderProject)

  render: =>
    @$el.html(@navBar.render().el)
    @$el.append(@template())
    @collection.forEach(@renderProject)
    @$el.append(@addActions.render().el)
    this

  renderProject: (project) =>
    view = new App.Views.ShowProject(model: project, tagName: 'li')
    @$('.projects').append(view.render().el)
