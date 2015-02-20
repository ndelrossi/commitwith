Commitwith.Models.Project = Backbone.Model.extend({

  defaults: {
    created_at: moment().toString()
  },

  has_name: function(name) {
    return this.get('name') === name;
  },

  has_language: function(language) {
    var regex = new RegExp("(^|,)" + language + "($|,)", 'g');
    return (this.get('languages') || " ").match(regex);
  },

  has_beginner: function() {
    return this.get('beginner') === "Yes";
  },

  has_category: function(category) {
    var regex = new RegExp(category, 'g');
    return (this.get('categories') || " ").match(regex);
  },

  has_any: function(search) {
    var regex = new RegExp(search.toLowerCase(), 'g');
    var searchText = [ this.get('name'),
                       this.get('description'),
                       this.get('needs'),
                       this.get('languages'),
                       this.get('categories'),
                       this.get('beginner'),
                       this.get('author') ].join().toLowerCase();

    return searchText.match(regex);
  }
});
