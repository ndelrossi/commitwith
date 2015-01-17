class App.Views.AddProject extends Backbone.View
  template: JST['projects/add-project']

  initialize: (options) ->
    @repo = options.repo

  events:
    'click .add-project-btn': 'addProject'

  render: ->
    @$el.html(@template(repo: @repo))
    @$('#add-project-modal').modal('show')
    this

  addProject: ->
    @collection.create({
      title: @$('.project-title').val()
      author: "ndelrossi"
    })
    @.remove()
