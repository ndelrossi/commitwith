window.Commitwith =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @AllProjects = new @Collections.Projects(@projectsJson)
    view = new @Views.Projects(collection: @AllProjects)
    $('#container').html(view.render().el)

window.App = window.Commitwith

$(document).ready ->
  Commitwith.initialize()
