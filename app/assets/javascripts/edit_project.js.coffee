class App.Views.EditProject extends Backbone.View
  template: JST['projects/edit']

  tagName: 'form'

  events:
    'submit': 'saveModel'

  render: ->
    @$el.html(@template(project: @model))
    this

  saveModel: (e) ->
    @model.save
      title: @$('.project-title').val()
      description: @$('.project-description').val()
    Backbone.history.navigate('/', trigger: true)
    false
