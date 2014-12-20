class App.Views.Projects extends Backbone.View
  template: JST['projects/index']

  render: ->
    @$el.html(@template())
    @collection.forEach(@renderProject)
    this

  renderProject: (project) =>
    view = new App.Views.ShowProject(model: project, tagName: 'li')
    @$('.projects').append(view.render().el)
