Commitwith.Collections.Projects = Backbone.Collection.extend({
  url: '/projects',
  model: Commitwith.Models.Project,

  byLanguage: function(language) {
    var filteredProjects = Commitwith.OriginalProjects.select(function(project) {
      return project.hasLanguage(language);
    });
    return filteredProjects;
  }
});
