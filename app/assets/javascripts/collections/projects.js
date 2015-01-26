Commitwith.Collections.Projects = Backbone.Collection.extend({
  url: '/projects',
  model: Commitwith.Models.Project,

  all: function() {
    return Commitwith.OriginalProjects.toJSON();
  },

  byLanguage: function(language) {
    var filteredProjects = Commitwith.OriginalProjects.select(function(project) {
      return project.hasLanguage(language);
    });
    return filteredProjects;
  }
});
