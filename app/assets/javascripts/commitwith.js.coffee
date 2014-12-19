window.Commitwith =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @AllProjects = [
      new @Models.Project(id: 1, title: "Project1", description: "The first project"),
      new @Models.Project(id: 2, title: "Project2", description: "The second project"),
      new @Models.Project(id: 3, title: "Project3", description: "The third project")
    ]
    new @Routers.CommitwithRouter
    Backbone.history.start(pushState: true)

window.App = window.Commitwith

$(document).ready ->
  Commitwith.initialize()
