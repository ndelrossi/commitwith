Commitwith.Collections.Projects = Backbone.Collection.extend({
  url: '/projects',
  model: Commitwith.Models.Project,


  all: function() {
    return Commitwith.OriginalProjects.toJSON();
  },

  has_project: function(title) {
    var exists = this.some(function(project) {
      return project.has_title(title);
    });
    return exists;
  },

  filter: function(filterName, selection) {
    var filteredProjects = Commitwith.OriginalProjects.select(function(project) {
      return project["has_" + filterName](selection);
    });
    return filteredProjects;
  }  
});
