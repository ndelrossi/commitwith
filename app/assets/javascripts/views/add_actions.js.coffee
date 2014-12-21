class App.Views.AddActions extends Backbone.View
  template: JST['projects/add-actions']

  className: 'add-actions'

  events:
    'click .add-project': 'addProject'

  render: ->
    @$el.html(@template())
    this

  addProject: ->
    @collection.add({})
    false
