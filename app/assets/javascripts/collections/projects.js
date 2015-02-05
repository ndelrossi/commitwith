Commitwith.Collections.Projects = Backbone.Collection.extend({
  url: '/projects',
  model: Commitwith.Models.Project,

  // Sorting. Code adapted from:
  // http://www.benknowscode.com/2013/01/creating-sortable-tables-with-backbone_8752.html

  sortAttribute: "created_at",
  sortDirection: -1,
 
  sortProjects: function (attr) {
    this.sortAttribute = attr;
    this.sort();
  },
 
  comparator: function(a, b) {
    var a = a.get(this.sortAttribute),
        b = b.get(this.sortAttribute);
 
    if (a == b) return 0;
 
    if (this.sortDirection == 1) {
      return a > b ? 1 : -1;
    } else {
      return a < b ? 1 : -1;
    }
  },

  // Filtering

  all: function() {
    return Commitwith.OriginalProjects.toJSON();
  },

  has_project: function(name) {
    var exists = this.some(function(project) {
      return project.has_name(name);
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
