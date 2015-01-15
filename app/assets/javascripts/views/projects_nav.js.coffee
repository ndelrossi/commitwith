class App.Views.ProjectsNav extends Backbone.View
  template: JST['projects/projects-nav']

  events:
    'click #find-repo': 'openProjectBuilder'

  render: ->
    @$el.html(@template())
    this.afterRender()

  afterRender: ->
    @$(".dropdown-menu").find("form").click (e) ->
      e.stopPropagation()

  openProjectBuilder: ->
    @$('#repo-dropdown-button').removeClass('open')
    @addProjectView = new App.Views.AddProject()
    @$el.append(@addProjectView.render().el)
