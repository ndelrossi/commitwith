window.Commitwith =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @AllProjects = new @Collections.Projects
    @AllProjects.fetch().done =>
      new @Routers.CommitwithRouter
      Backbone.history.start(pushState: true)

window.App = window.Commitwith

$(document).ready ->
  Commitwith.initialize()
