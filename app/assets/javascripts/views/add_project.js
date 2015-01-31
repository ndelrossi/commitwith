Commitwith.Views.AddProject = Backbone.View.extend({
  template: JST['projects/add-project'],

  initialize: function(options) {
    this.repo = options.repo;
  },

  events: {
    'click #modal-add-project': 'addProject'
  },

  render: function() {
    this.$el.html(this.template({repo: this.repo}));
    this.$('#add-project-modal').modal('show');
    return this;
  },

  addProject: function() {
    $('.modal-backdrop').remove();
    this.collection.create({
      title: this.repo.get('name'),
      author: this.repo.get('owner').login,
      description: this.repo.get('description'),
      languages: this.repo.get("language"),
      size: this.repo.get("size"),
      open_issues: this.repo.get("open_issues_count"),
      category: this.$( "#select-category" ).val(),
      skill: this.getSkill()
    });
    this.remove();
  },

  getSkill: function() {
    var skill = new Array();
    $(".checkbox-skill:checked").each(function() {
      skill.push($(this).val());
    });
    return skill.toString();
  }
});
