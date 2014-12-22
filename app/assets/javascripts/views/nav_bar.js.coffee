class App.Views.NavBar extends Backbone.View
    template: JST['projects/nav-bar']

    initialize: ->
      @addProject = new App.Views.AddProject()

    className: 'nav-bar'

    render: ->
      @$el.html(@template)
      @$('#add-project').append(@addProject.render().el)
      this
