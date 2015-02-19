Commitwith.Views.ShowProject = Backbone.View.extend({
  template: JST['projects/show'],
  tagName: 'tr',
  className: 'project',

  initialize: function() {
    this.last_update = moment(this.model.get('last_update')).fromNow(true);
    this.expandedShow = new Commitwith.Views.ShowExpanded({model: this.model});
    this.expandedShowOpen = false;
  },

  events: {
    'click': 'triggerExpandedView'
  },

  render: function() {
    this.$el.html(this.template({project: this.model, updated: this.last_update}));
    this.afterRender();
    return this;
  },

  triggerExpandedView: function() {
    if(this.expandedShowOpen == false) {
      this.$el.after(this.expandedShow.render().el);
      this.expandedShowOpen = true;
    } else {
      this.expandedShow.remove();
      this.expandedShowOpen = false;
    }
  },

  afterRender: function() {
    this.$(".beginner").html(function() {
      return $(this).html().replace("," , "<br>");
    });
    this.$(".categories").html(function() {
      return $(this).html().replace(/,/g , "<br>");
    });
    this.$(".languages").html(function() {
      return $(this).html().replace(/,/g , "<br>");
    });
  }
});
