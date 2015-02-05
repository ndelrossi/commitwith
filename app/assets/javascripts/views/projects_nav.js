Commitwith.Views.ProjectsNav = Backbone.View.extend({
  template: JST['projects/projects-nav'],

  events: {
    'click #find-repo': 'checkRepoURL',
    'click #button-filter-projects': 'openFilters',
    'click #button-reset-projects': 'resetProjectsList',
    'keyup #input-search': 'searchProjects',
    'click #button-search': 'searchProjects'
  },

  render: function() {
    this.$el.html(this.template());
    this.afterRender();
    return this;
  },

  afterRender: function() {
    this.$(".dropdown-menu #repo-name, .dropdown-menu #repo-owner").click(function(e) {
      return e.stopPropagation();
    });
  },

  searchProjects: function() {
    this.collection.reset(this.collection.filter('any', this.$('#input-search').val()));
  },

  openProjectBuilder: function(repo) {
    this.addProjectView = new Commitwith.Views.AddProject({collection: this.collection, repo: repo});
    this.$el.append(this.addProjectView.render().el);
  },
  
  openFilters: function() {
    this.filterProjectsView = new Commitwith.Views.FilterProjects({collection: this.collection});
    this.$el.append(this.filterProjectsView.render().el);
  },

  resetProjectsList: function() {
    this.collection.sortDirection = -1;
    this.collection.sortProjects('created_at');
    this.collection.reset(this.collection.all());
  },

  displayError: function(messageText) {
    errorView = new Commitwith.Views.Errors({message: messageText});
    $('#errors-container').append(errorView.render().el);
  },

  checkRepoURL: function() {
    var name = this.$('#repo-name').val().toLowerCase().trim();
    var owner = this.$('#repo-owner').val().toLowerCase().trim();
    var repo = new Commitwith.Models.Repo({id: "/" + owner + "/" + name});
    var self = this;
    repo.fetch({
      success: function() {
        if (self.collection.has_project(repo.get('name')) == true) {
          self.displayError("Repo already exists");
          return;
        }
        if (repo.get('private') == false) {
          self.openProjectBuilder(repo);
        } else {
          self.displayError("Repo has to be public");
        }
      },
      error: function() {
        self.displayError("Repo not found or repo is private");
      },
    });
  }
});
