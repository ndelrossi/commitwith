class App.Views.AddProject extends Backbone.View
  template: JST['projects/add-project']

  initialize: ->
    @repo = new App.Models.Repo
    @repo.fetch()

  events:
    'click .add-project-btn': 'addProject'

  render: ->
    @$el.html(@template())
    @$('.testp').html(@repo.get("name"))
    this

  addProject: ->
    @collection.create({
      title: @$('.project-title').val()
      description: @$('.project-content').val()
    })
    false
