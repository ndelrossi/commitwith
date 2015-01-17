class App.Views.AddProject extends Backbone.View
  template: JST['projects/add-project']

  initialize: (options) ->
    @repo = options.repo

  events:
    'click #modal-add-project': 'addProject'

  render: ->
    @$el.html(@template(repo: @repo))
    @$('#add-project-modal').modal('show')
    this

  addProject: ->
    $('.modal-backdrop').remove()
    @collection.create({
      title: @repo.get('name')
      author: @repo.get('owner').login
    })
    @remove()
