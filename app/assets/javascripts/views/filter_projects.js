Commitwith.Views.FilterProjects = Backbone.View.extend({
  template: JST['projects/filter-projects'],

  events: {
    'click .filter-language,.filter-category,.filter-beginner': 'updateList'
  },

  render: function() {
    this.$el.html(this.template());
    this.$('#filter-projects-modal').modal('show');
    return this;
  },

  updateList: function(e) {
    $('.modal-backdrop').remove();
    var filterName = $(e.target).attr('class').split("-")[1];
    var selection = e.target.text;
    this.collection.reset(this.collection.filter(filterName, selection));
    this.remove();
  }
});
