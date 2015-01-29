Commitwith.Models.Project = Backbone.Model.extend({

  initialize: function() {
    this.repo = new Commitwith.Models.Repo({id: "/" + this.get("author") + "/" + this.get("title")});

    var self = this;
    this.repo.fetch({
      success: function() {
        self.set({
          language: self.repo.get("language"),
          description: self.repo.get("description"),
          owner: self.repo.get("owner").login,
          open_issues_count: self.repo.get("open_issues_count"),
          size: self.repo.get("size"),
          last_update: self.repo.get("updated_at").split("T")[0]
        });
      }
    });
  },

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
