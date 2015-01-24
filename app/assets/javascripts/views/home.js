Commitwith.Views.Home = Backbone.View.extend({
  template: JST['layout/index'],

  initialize: function() {
    this.projectsNavView = new Commitwith.Views.ProjectsNav({collection: this.collection});
    this.projectsView = new Commitwith.Views.Projects({collection: this.collection});
  },

  render: function() {
    this.$el.html(this.template());
    this.projectsNavView.setElement(this.$('.projects-nav')).render();
    this.projectsView.setElement(this.$('.projects-list')).render();
    return this;
  },
});
