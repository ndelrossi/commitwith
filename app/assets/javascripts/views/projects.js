Commitwith.Views.Projects = Backbone.View.extend({
  template: JST['projects/index'],

  events: {
    'click #sort-open_issues,#sort-size': 'sortProjects'
  },

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

  sortProjects: function(e) {
    var sortAttr = $(e.target).attr('id').split("-")[1];
    this.collection.sortDirection *= -1;
    this.collection.sortProjects(sortAttr);
    this.render();
  },
});
