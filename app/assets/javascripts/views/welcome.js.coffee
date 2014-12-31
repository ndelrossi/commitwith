class App.Views.Welcome extends Backbone.View
  template: JST['layout/welcome']

  events:
    'click #new-project-view': 'renderAddProject'

  render: ->
    @$el.html(@template)
    this

  renderAddProject: ->
    @addProjectView = new App.Views.AddProject(collection: @collection)
    repo_id = $('#new-project-title').val()
    repo = new App.Models.Repo({id: repo_id})
    @$el.append(@addProjectView.render().el)
    repo.fetch({
      success: (data) ->
        @$('.project-title').val(repo.get("name"))
        @$('.project-content').val(repo.get("description"))
    })
