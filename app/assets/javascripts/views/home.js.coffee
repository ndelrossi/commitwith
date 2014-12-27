class App.Views.HomeView extends Backbone.View
  template: JST['layout/index']

  initialize: ->
    @topNavView = new App.Views.TopNav(collection: @collection)
    @sideNavView = new App.Views.SideNav(collection: @collection)
    @projectsView = new App.Views.Projects(collection: @collection)
    @leftNavLinksView = new App.Views.LeftNavLinks(collection: @collection)

  render: ->
    @$el.html(@template())
    @topNavView.setElement(@$('.top-bar')).render()
    @sideNavView.setElement(@$('.side-bar')).render()
    @leftNavLinksView.setElement(@$('.left-nav-links-container')).render()
    @$('.main-content-container').append(@projectsView.render().el)
    this
