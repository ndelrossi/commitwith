class App.Views.ProjectsNav extends Backbone.View
  template: JST['projects/projects-nav']

  events:
    'click #find-repo': 'openProjectBuilder'

  render: ->
    @$el.html(@template())
    this.afterRender()

  afterRender: ->
    @$(".dropdown-menu #repo-input").click (e) ->
      e.stopPropagation()

  openProjectBuilder: ->
    #@addProjectView = new App.Views.AddProject()
    #@$el.append(@addProjectView.render().el)
    $(".errors").html('<div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>Repo not found. Please check URL</div>')
