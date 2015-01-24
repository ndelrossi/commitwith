Commitwith.Views.Errors = Backbone.View.extend({
  template: JST['layout/errors'],

  el: '.errors',

  events: {
    'click #alert-close': 'removeAlert'
  },

  initialize: function(options) {
    this.message = options.message;
  },

  render: function() {
    this.$el.html(this.template());
    this.$('#error-message').html(this.message);
  },

  removeAlert: function() {
    this.remove();
  }
});
