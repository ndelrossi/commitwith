Commitwith.Views.Errors = Backbone.View.extend({
  template: JST['layout/errors'],

  className: '.errors',

  events: {
    'click #alert-close': 'removeAlert'
  },

  initialize: function(options) {
    this.message = options.message;
  },

  render: function() {
    this.$el.html(this.template({message: this.message}));
    return this;
  },

  removeAlert: function() {
    this.remove();
  }
});
