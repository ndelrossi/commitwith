class App.Views.AddProject extends Backbone.View
  template: JST['projects/add-project']

  events:
    'click .add-project-btn': 'addProject'

  render: ->
    @$el.html(@template())
    this

  addProject: ->
    @collection.create({
      title: @$('.project-title').val()
      description: @$('.project-content').val()
    })
    false

  save: ->
    @model.set
      title: @$('.project-title').val()
      description: @$('.project-content').val()
    @model.save()
    false
