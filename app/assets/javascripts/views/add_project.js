Commitwith.Views.AddProject = Backbone.View.extend({
  template: JST['projects/add-project'],

  initialize: function(options) {
    this.repo = options.repo;
  },

  events: {
    'click #modal-add-project': 'addProject'
  },

  render: function() {
    this.$el.html(this.template({repo: this.repo}));
    this.$('#add-project-modal').modal('show');
    return this;
  },

  addProject: function() {
    $('.modal-backdrop').remove();
    this.collection.create({
      title: this.repo.get('name'),
      author: this.repo.get('owner').login
    })
    this.remove();
  }
});