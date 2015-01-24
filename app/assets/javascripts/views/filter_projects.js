Commitwith.Views.FilterProjects = Backbone.View.extend({
  template: JST['projects/filter-projects'],

  render: function() {
    this.$el.html(this.template());
    this.$('#filter-projects-modal').modal('show');
    return this;
  }
});
