class App.Views.HomeView extends Backbone.View
  template: JST['layout/index']

  initialize: ->
    @topNavView = new App.Views.TopNav()
    @sideNavView = new App.Views.SideNav(collection: @collection)
    @projectsView = new App.Views.Projects(collection: @collection)
    @leftNavLinksView = new App.Views.LeftNavLinks(collection: @collection)
    @welcomeView = new App.Views.Welcome(collection: @collection)

  render: ->
    @$el.html(@template())
    @topNavView.setElement(@$('.top-bar')).render()
    @sideNavView.setElement(@$('.side-bar')).render()
    @leftNavLinksView.setElement(@$('.left-nav-links-container')).render()
    @welcomeView.setElement(@$('.welcome')).render()
    @projectsView.setElement(@$('.project-list')).render()
    this

  remove: ->
    @topNavView.remove(arguments...)
    @sideNavView.remove(arguments...)
    @leftNavLinksView.remove(arguments...)
    @welcomeView.remove(arguments...)
    @projectsView.remove(arguments...)
    super(arguments...)
