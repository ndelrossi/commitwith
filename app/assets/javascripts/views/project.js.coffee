class App.Views.ShowProject extends Backbone.View
  template: JST['projects/show']

  className: 'project'

  events:
    'click .destroy-project': 'destroyProject'

  render: ->
    @$el.html(@template(project: @model))
    this

  destroyProject: ->
    @model.destroy()
    @remove()
    false
