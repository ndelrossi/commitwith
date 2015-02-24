Commitwith.Views.Alerts = Backbone.View.extend({
  template: JST['layout/alerts'],

  className: '.alerts',

  events: {
    'click #alert-close': 'removeAlert'
  },

  initialize: function(options) {
    this.alertCode = options.alertCode;

    this.alertMessages = {
      "new": "Project added.",
      "not_found": "Project not found. Please try adding again.",
      "project_exists": "Project already exists.",
      "repo_private": "Github repository needs to be public."
    };

    this.alertClasses = {
      "new": "success",
      "not_found": "danger",
      "project_exists": "danger",
      "repo_private": "danger"
    };
  },

  render: function() {
    this.$el.html(this.template({alertClass: this.alertClasses[this.alertCode], 
                                 message:    this.alertMessages[this.alertCode]}));
    return this;
  },

  removeAlert: function() {
    this.remove();
  }
});
