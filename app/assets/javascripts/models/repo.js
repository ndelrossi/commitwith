Commitwith.Models.Repo = Backbone.Model.extend({
  urlRoot: 'https://api.github.com/repos',

  url: function() {
    return this.urlRoot + this.id
  }
});
