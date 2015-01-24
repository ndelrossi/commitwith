Commitwith.Models.Project = Backbone.Model.extend({

  initialize: function() {
    this.repo = new Commitwith.Models.Repo({id: "/" + this.get("author") + "/" + this.get("title")});

    var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
    this.repo.fetch({
      success: __bind(function(data) {
        return this.set({
          language: this.repo.get("language"),
          description: this.repo.get("description"),
          owner: this.repo.get("owner").login,
          open_issues_count: this.repo.get("open_issues_count"),
          size: this.repo.get("size"),
          last_update: this.repo.get("updated_at").split("T")[0]
        });
      }, this)
    });
  }
});
