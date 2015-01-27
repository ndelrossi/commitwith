Commitwith.Views.ShowProject = Backbone.View.extend({
  template: JST['projects/show'],
  tagName: 'tr',
  className: 'project',

  events: {
    'click .destroy-project': 'destroyProject'
  },

  render: function() {
    this.$el.html(this.template({project: this.model}));
    this.displaySkills();
    return this;
  },

  destroyProject: function() {
    this.model.destroy();
    this.remove();
    return false;
  },

  displaySkills: function() {
    this.$('.skill').each(function() {
      $(this).html($(this).html().replace(/\s/g, "<br>"));
    });
  }
});
