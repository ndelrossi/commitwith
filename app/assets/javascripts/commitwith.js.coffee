window.Commitwith =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    view = new @Views.AppView()
    $('#app-container').html(view.render().el)

window.App = window.Commitwith

$(document).ready ->
  Commitwith.initialize()
