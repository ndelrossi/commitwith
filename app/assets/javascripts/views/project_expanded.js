Commitwith.Views.ShowExpanded = Backbone.View.extend({
  template: JST['projects/expanded-show'],
  tagName: 'tr',
  className: 'project-expanded',

  initialize: function() {
    this.last_update = moment(this.model.get('last_update')).fromNow(true);
  },
    
  render: function() {
    console.log(this.updated);
    this.$el.html(this.template({project: this.model, updated: this.last_update}));
    return this;
  }
});

