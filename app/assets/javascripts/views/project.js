Commitwith.Views.ShowProject = Backbone.View.extend({
  template: JST['projects/show'],
  tagName: 'tr',
  className: 'project',

  events: {
    'click .destroy-project': 'destroyProject'
  },

  render: function() {
    this.$el.html(this.template({project: this.model}));
    this.afterRender();
    return this;
  },

  destroyProject: function() {
    this.model.destroy();
    this.remove();
    return false;
  },

  afterRender: function() {
    this.$(".skill").html(function() {
      return $(this).html().replace("," , "<br>");
    });
  }
});
