window.Commitwith =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new @Routers.CommitwithRouter
    Backbone.history.start(pushState: true)

window.App = window.Commitwith

$(document).ready ->
  Commitwith.initialize()
