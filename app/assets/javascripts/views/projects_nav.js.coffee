class App.Views.ProjectsNav extends Backbone.View
  template: JST['projects/projects-nav']

  events:
    'click #find-repo': 'checkRepoURL'

  render: ->
    @$el.html(@template())
    this.afterRender()

  afterRender: ->
    @$(".dropdown-menu #repo-name, .dropdown-menu #repo-owner").click (e) ->
      e.stopPropagation()

  openProjectBuilder: (repo) ->
    @addProjectView = new App.Views.AddProject()
    @$el.append(@addProjectView.render().el)

  displayError: ->
    $(".errors").html('<div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>Repo not found.</div>')

  checkRepoURL: ->
    name = @$('#repo-name').val().toLowerCase()
    owner = @$('#repo-owner').val().toLowerCase()
    repo = new App.Models.Repo({id: "/" + owner + "/" + name})
    repo.fetch({
      success: (data) =>
        @openProjectBuilder(repo)
      error: (data) =>
        @displayError()
    })
