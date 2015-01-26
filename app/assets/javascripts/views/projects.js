Commitwith.Views.Projects = Backbone.View.extend({
  template: JST['projects/index'],

  initialize: function() {
    this.listenTo(this.collection, 'add', this.render);
    this.listenTo(this.collection, 'reset', this.render);
    this.listenTo(this.collection, 'change', this.render);
  },

  render: function() {
    this.$el.html(this.template({currentSize: this.collection.length, totalSize: Commitwith.OriginalProjects.length}));
    this.collection.forEach(this.renderProject);
    return this;
  },

  renderProject: function(project) {
    var view = new Commitwith.Views.ShowProject({model: project});
    $('.projects-table-body').append(view.render().el);
  }
});
