class App.Routers.CommitwithRouter extends Backbone.Router
  routes:
    '': 'home'
    'projects/:id': 'showProject'

  home: ->
    alert("you requested home page")

  showProject: (id) ->
    alert("you requested showProjects with id #{id}")
