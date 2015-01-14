class App.Views.ProjectsNav extends Backbone.View
  template: JST['projects/projects-nav']

  render: ->
    @$el.html(@template())
    this.afterRender()

  afterRender: ->
    @$(".dropdown-menu").find("form").click (e) ->
      e.stopPropagation()
    @$("#find-repo").click =>
      @$('#repo-dropdown-button').removeClass('open')
