class App.Views.Errors extends Backbone.View
  template: JST['layout/errors']

  el: '.errors'

  initialize: (options) ->
    @message = options.message

  events:
    'click #alert-close': 'removeAlert'

  render: ->
    @$el.html(@template())
    @$('#error-message').html(@message)

  removeAlert: ->
    @remove()
