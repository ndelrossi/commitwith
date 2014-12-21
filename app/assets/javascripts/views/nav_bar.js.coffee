class App.Views.NavBar extends Backbone.View
    template: JST['projects/nav-bar']

    className: 'nav-bar'

    render: ->
      @$el.html(@template)
      this
