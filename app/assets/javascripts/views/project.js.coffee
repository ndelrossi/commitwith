class App.Views.ShowProject extends Backbone.View
  template: JST['projects/show']

  className: 'project'

  events:
    'click .edit-project': 'showProject'

  render: ->
    @$el.html(@template(project: @model))
    this

  showProject: ->
    Backbone.history.navigate(@model.url(), trigger: true)
    false
