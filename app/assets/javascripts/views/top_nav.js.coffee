class App.Views.TopNav extends Backbone.View
  template: JST['layout/top-nav']

  initialize: ->
    @addProject = new App.Views.AddProject(collection: @collection)

  render: ->
    @$el.html(@template)
    @$('#add-project').append(@addProject.render().el)
    this