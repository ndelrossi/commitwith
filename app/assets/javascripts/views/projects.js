Commitwith.Views.Projects = Backbone.View.extend({
  template: JST['projects/index'],

  initialize: function() {
    this.listenTo(this.collection, 'add', this.render);
    this.listenTo(this.collection, 'reset', this.render);
    this.listenTo(this.collection, 'change', this.render);
  },

  render: function() {
    this.$el.html(this.template({currentSize: this.collection.length, totalSize: Commitwith.OriginalProjects.length}));

    var self = this;
    this.collection.forEach(function (project) {
      var view = new Commitwith.Views.ShowProject({model: project});
      self.$('.projects-table-body').append(view.render().el);
    });

    return this;
  },
});
