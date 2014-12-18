class App.Views.Projects extends Backbone.View
  template: JST['projects/index']

  events:
    'click a': 'showProject'

  render: ->
    @$el.html(@template(projects: @collection))
    this

  showProject: (e) ->
    $this = $(e.currentTarget)
    url = $this.attr("href")
    Backbone.history.navigate(url, trigger: true)
    false
