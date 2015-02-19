Commitwith.Views.ShowExpanded = Backbone.View.extend({
  template: JST['projects/expanded-show'],
  tagName: 'tr',
  className: 'project-expanded',

  render: function() {
    this.$el.html(this.template());
    return this;
  }
});

