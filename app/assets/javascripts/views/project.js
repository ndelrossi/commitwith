Commitwith.Views.ShowProject = Backbone.View.extend({
  template: JST['projects/show'],
  tagName: 'tr',
  className: 'project',

  initialize: function() {
    this.last_update = moment(this.model.get('last_update')).fromNow(true);
  },

  events: {
    'click .destroy-project': 'destroyProject'
  },

  render: function() {
    this.$el.html(this.template({project: this.model, updated: this.last_update}));
    this.afterRender();
    return this;
  },

  destroyProject: function() {
    this.model.destroy();
    this.remove();
    return false;
  },

  afterRender: function() {
    this.$(".beginner").html(function() {
      return $(this).html().replace("," , "<br>");
    });
    this.$(".categories").html(function() {
      return $(this).html().replace(/,/g , "<br>");
    });
    this.$(".languages").html(function() {
      return $(this).html().replace(/,/g , "<br>");
    });
  }
});
