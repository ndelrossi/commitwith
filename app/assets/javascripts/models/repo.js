Commitwith.Models.Repo = Backbone.Model.extend({
  urlRoot: 'https://api.github.com/repos',

  initialize: function() {
    this.getLanguages();
  },

  url: function() {
    return this.urlRoot + this.id
  },

  getLanguages: function() {
    var self = this;
    $.ajax({
      url: this.url() + "/languages",
      type: "GET",
      dataType: "json",
      success: function(results) {
        self.set("languages", Object.keys(results).slice(0, 3).toString());
      }
    });
  }
});
