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

  hasLanguage: function(language) {
    return this.get('language') === language;
  }
});
