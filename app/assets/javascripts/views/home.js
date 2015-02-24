Commitwith.Views.Home = Backbone.View.extend({
  template: JST['layout/index'],

  initialize: function() {
    this.projectsNavView = new Commitwith.Views.ProjectsNav({collection: this.collection});
    this.projectsView = new Commitwith.Views.Projects({collection: this.collection});
  },

  render: function() {
    this.$el.html(this.template());
    this.projectsNavView.setElement(this.$('.projects-nav')).render();
    this.projectsView.setElement(this.$('.projects-list')).render();
    this.renderAlerts();
    return this;
  },

  renderAlerts: function() {
    var alertCode = this.getUrlParameter('alert');
    if (alertCode) {
      alertView = new Commitwith.Views.Alerts({alertCode: alertCode});
      this.$('#alerts-container').append(alertView.render().el);
    }
    return this;
  },

  //from: http://www.jquerybyexample.net/2012/06/get-url-parameters-using-jquery.html
  getUrlParameter: function(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
      var sParameterName = sURLVariables[i].split('=');
      if (sParameterName[0] == sParam) 
      {
        return sParameterName[1];
      }
    }
  }     
});
