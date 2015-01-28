Commitwith.Collections.Projects = Backbone.Collection.extend({
  url: '/projects',
  model: Commitwith.Models.Project,


  // FILTERS

  all: function() {
    return Commitwith.OriginalProjects.toJSON();
  },

  filter: function(filterName, selection) {
    var filteredProjects = Commitwith.OriginalProjects.select(function(project) {
      return project["has_" + filterName](selection);
    });
    return filteredProjects;
  }  
});
