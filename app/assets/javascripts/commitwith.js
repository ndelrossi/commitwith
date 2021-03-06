window.Commitwith = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(data) {
    this.AllProjects = new Commitwith.Collections.Projects(data.projectsJson);
    this.OriginalProjects = new Commitwith.Collections.Projects(this.AllProjects.toJSON());
    var view = new this.Views.Home({collection: this.AllProjects});
    $('#app-container').html(view.render().el);
  }
};
