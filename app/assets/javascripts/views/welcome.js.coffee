class App.Views.Welcome extends Backbone.View
  template: JST['layout/welcome']

  initialize: ->
    @addProjectView = new App.Views.AddProject(collection: @collection)

  events:
    'click #new-project-view': 'renderAddProject'

  render: ->
    @$el.html(@template)
    this

  renderAddProject: ->
    @$el.append(@addProjectView.render().el)
