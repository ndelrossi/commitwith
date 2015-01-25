Commitwith.Views.ProjectsNav = Backbone.View.extend({
  template: JST['projects/projects-nav'],

  events: {
    'click #find-repo': 'checkRepoURL',
    'click #button-filter-projects': 'openFilters'
  },

  render: function() {
    this.$el.html(this.template());
    this.afterRender();
  },

  afterRender: function() {
    this.$(".dropdown-menu #repo-name, .dropdown-menu #repo-owner").click(function(e) {
      return e.stopPropagation();
    });
  },

  openProjectBuilder: function(repo) {
    this.addProjectView = new Commitwith.Views.AddProject({collection: this.collection, repo: repo});
    this.$el.append(this.addProjectView.render().el);
  },
  
  openFilters: function() {
    this.filterProjectsView = new Commitwith.Views.FilterProjects({collection: this.collection});
    this.$el.append(this.filterProjectsView.render().el);
  },

  displayError: function() {
    this.errorView = new Commitwith.Views.Errors({message: "Repo not found."});
    this.errorView.render();
  },

  checkRepoURL: function() {
    var name = this.$('#repo-name').val().toLowerCase();
    var owner = this.$('#repo-owner').val().toLowerCase();
    var repo = new Commitwith.Models.Repo({id: "/" + owner + "/" + name});
    var self = this;
    repo.fetch({
      success: function() {
        self.openProjectBuilder(repo);
      },
      error: function() {
        self.displayError();
      },
    });
  }
});
