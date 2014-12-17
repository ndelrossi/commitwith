window.Commitwith =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> alert 'Hello from Backbone!'

window.App = window.Commitwith

$(document).ready ->
  Commitwith.initialize()
