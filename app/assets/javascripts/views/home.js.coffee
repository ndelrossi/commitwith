class App.Views.HomeView extends Backbone.View
  template: JST['layout/index']

  initialize: ->
    @topNavView = new App.Views.TopNav(collection: @collection)
    @sideNavView = new App.Views.SideNav(collection: @collection)
    @projectsView = new App.Views.Projects(collection: @collection)
    @leftNavLinksView = new App.Views.LeftNavLinks(collection: @collection)

  render: ->
    @$el.html(@template())
    @$('.top-bar').append(@topNavView.render().el)
    @$('.side-bar').append(@sideNavView.render().el)
    @$('.main-content-container').append(@projectsView.render().el)
    @$('.left-nav-links-container').append(@leftNavLinksView.render().el)
    this
