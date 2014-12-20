class App.Views.ShowProject extends Backbone.View
  template: JST['projects/show']

  className: 'project'

  events:
    'change': 'save'
    'keydown .project-title': 'blurIfEnter'
    'focus .project-title, .project-content': 'beginEditing'
    'blur .project-title, .project-content': 'endEditing'

  render: ->
    @$el.html(@template(project: @model))
    this

  save: ->
    @model.set
      title: @$('.project-title').val()
      description: @$('.project-content').val()
    @model.save()
    false

  blurIfEnter: (e) ->
    if e.keyCode == 13
      @$(':input').blur()

  beginEditing: ->
    @$el.addClass('editing')

  endEditing: ->
    @$el.removeClass('editing')
