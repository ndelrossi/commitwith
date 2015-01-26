Commitwith.Views.FilterProjects = Backbone.View.extend({
  template: JST['projects/filter-projects'],

  events: {
    'click .filter-language': 'updateLanguage',
    'click .filter-category': 'updateCategory'
  },

  render: function() {
    this.$el.html(this.template());
    this.$('#filter-projects-modal').modal('show');
    return this;
  },

  updateLanguage: function(e) {
    $('.modal-backdrop').remove();
    this.collection.reset(this.collection.byLanguage(e.target.text));
    this.remove();
  },

  updateCategory: function(e) {
    $('.modal-backdrop').remove();
    this.collection.reset(this.collection.byCategory(e.target.text));
    this.remove();
  }
});
