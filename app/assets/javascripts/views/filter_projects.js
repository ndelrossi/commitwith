Commitwith.Views.FilterProjects = Backbone.View.extend({
  template: JST['projects/filter-projects'],

  events: {
    'click .filter-language': 'updateList'
  },

  render: function() {
    this.$el.html(this.template());
    this.$('#filter-projects-modal').modal('show');
    return this;
  },

  updateList: function(e) {
    $('.modal-backdrop').remove();
    this.collection.reset(this.collection.byLanguage(e.target.text));
    this.remove();
  }
});
