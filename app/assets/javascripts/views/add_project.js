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
    this.setUpMultiSelects();
    return this;
  },

  addProject: function() {
    $('.modal-backdrop').remove();
    var new_model = {
      name: this.repo.get('name'),
      author: this.repo.get('owner').login,
      description: this.repo.get('description'),
      languages: (this.$("#multi-select-languages").val() || " ").toString(),
      size: this.repo.get("size"),
      open_issues: this.repo.get("open_issues_count"),
      categories: (this.$("#multi-select-categories").val() || " ").toString(),
      beginner: $(".checkbox-beginner:checked").val(),
      last_update: this.repo.get("updated_at")
    };
    this.collection.create(new_model);
    Commitwith.OriginalProjects.add(new_model);
    this.remove();
  },

  getSkill: function() {
    var skill = new Array();
    $(".checkbox-skill:checked").each(function() {
      skill.push($(this).val());
    });
    return skill.toString();
  },

  setUpMultiSelects: function() {
    this.$('#multi-select-categories').multiselect({
      nonSelectedText: 'Select categories',
      buttonWidth: '100%'
    });
    this.$('#multi-select-languages').multiselect({
      nonSelectedText: 'Select languages',
      buttonWidth: '100%'
    });

    var languageOptions = [];
    var primaryLang = this.repo.get('language');
    this.repo.get('languages').split(',').forEach(function(lang) {
      languageOptions.push({label: lang, value: lang, selected: (lang === primaryLang ? true : false)});
    });
    this.$('#multi-select-languages').multiselect('dataprovider', languageOptions);
  }
});
