Commitwith.Models.Project = Backbone.Model.extend({

  defaults: {
    created_at: moment().toString()
  },

  has_title: function(title) {
    return this.get('title') === title;
  },

  has_language: function(language) {
    var regex = new RegExp(language, 'g');
    return (this.get('languages') || " ").match(regex);
  },

  has_skill: function(skill) {
    var regex = new RegExp(skill, 'g');
    return (this.get('skill') || " ").match(regex);
  },

  has_category: function(category) {
    var regex = new RegExp(category, 'g');
    return (this.get('category') || " ").match(regex);
  },

  has_any: function(search) {
    var regex = new RegExp(search.toLowerCase(), 'g');
    var searchText = [ this.get('title'),
                       this.get('description'),
                       this.get('languages'),
                       this.get('category'),
                       this.get('skill'),
                       this.get('author') ].join().toLowerCase();

    return searchText.match(regex);
  }
});
