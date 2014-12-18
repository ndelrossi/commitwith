class App.Routers.CommitwithRouter extends Backbone.Router
  routes:
    '': 'home'
    'projects/:id': 'showProject'

  home: ->
    view = new App.Views.Projects(collection: App.AllProjects)
    $('#container').html(view.render().el)

  showProject: (id) ->
    model = App.AllProjects[id - 1]
    view = new App.Views.ShowProject(model: model)
    console.log("you requested showProjects with id #{id}")
    $('#container').html(view.render().el)
