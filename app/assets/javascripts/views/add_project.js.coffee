class App.Views.AddProject extends Backbone.View
  template: JST['projects/add-project']

  className: 'add-project'

  render: ->
    @$el.html(@template())
    this
