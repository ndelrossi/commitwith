class App.Views.ShowProject extends Backbone.View
  template: JST['projects/show']

  render: ->
    @$el.html(@template(project: @model))
    this
