class App.Views.AddProject extends Backbone.View
  template: JST['projects/add-project']

  events:
    'click .add-project-btn': 'addProject'

  render: ->
    @$el.html(@template())
    console.log("rendering addproject view")
    @$('#add-project-modal').modal('show')
    this

  addProject: ->
    @collection.create({
      title: @$('.project-title').val()
      author: "ndelrossi"
    })
    @.remove()
