class App.Views.ShowProject extends Backbone.View
  template: JST['projects/show']

  className: 'project'

  events:
    'keydown .project-title': 'blurIfEnter'
    'focus .project-title, .project-content': 'beginEditing'
    'blur .project-title, .project-content': 'endEditing'
    'click .destroy-project': 'destroyProject'

  render: ->
    @$el.html(@template(project: @model))
    this

  blurIfEnter: (e) ->
    if e.keyCode == 13
      @$(':input').blur()

  beginEditing: ->
    @$el.addClass('editing')

  endEditing: ->
    @$el.removeClass('editing')

  destroyProject: ->
    @model.destroy()
    @remove()
    false
