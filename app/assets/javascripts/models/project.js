Commitwith.Models.Project = Backbone.Model.extend({

  has_language: function(language) {
    return this.get('language') === language;
  },

  has_skill: function(skill) {
    var regex = new RegExp(skill, 'g');
    return (this.get('skill') || " ").match(regex);
  },

  has_category: function(category) {
    return this.get('category') === category;
  },

  has_any: function(search) {
    var regex = new RegExp(search.toLowerCase(), 'g');
    var searchText = [ this.get('title'),
                       this.get('description'),
                       this.get('language'),
                       this.get('category'),
                       this.get('skill'),
                       this.get('author') ].join().toLowerCase();

    return searchText.match(regex);
  }
});
