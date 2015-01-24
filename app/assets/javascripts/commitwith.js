window.Commitwith = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(data) {
    this.AllProjects = new Commitwith.Collections.Projects(data.projectsJson);
    var view = new this.Views.Home({collection: this.AllProjects});
    //var view = new this.Views.Home();
    $('#app-container').html(view.render().el);
  }
};
