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
    this.setUpMultiSelectsFor('#multi-select-category');
    this.setUpMultiSelectsFor('#multi-select-languages');

    var options = [];
    this.repo.get('languages').split(',').forEach(function(lang) {
      options.push({label: lang, title: lang, value: lang, selected: true});
    });
    this.$('#multi-select-languages').multiselect('dataprovider', options);


    return this;
  },

  addProject: function() {
    $('.modal-backdrop').remove();
    var new_model = {
      title: this.repo.get('name'),
      author: this.repo.get('owner').login,
      description: this.repo.get('description'),
      languages: (this.$("#multi-select-languages").val() || " ").toString(),
      size: this.repo.get("size"),
      open_issues: this.repo.get("open_issues_count"),
      category: (this.$("#multi-select-category").val() || " ").toString(),
      skill: this.getSkill(),
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

  setUpMultiSelectsFor: function(selector) {
    var self = this;
    this.$(selector).multiselect({
      nonSelectedText: 'Select up to 3 categories',
      buttonWidth: '100%',
      onChange: function(option, checked) {
        var selectedOptions = self.$(selector + ' option:selected');
 
        if (selectedOptions.length >= 3) {
          // Disable all other checkboxes.
          var nonSelectedOptions = self.$(selector + ' option').filter(function() {
            return !$(this).is(':selected');
          });
 
          var dropdown = self.$(selector).siblings('.multiselect-container');
          nonSelectedOptions.each(function() {
            var input = self.$('input[value="' + $(this).val() + '"]');
            input.prop('disabled', true);
            input.parent('li').addClass('disabled');
          });
        }
        else {
          // Enable all checkboxes.
          var dropdown = self.$(selector).siblings('.multiselect-container');
          $(selector + ' option').each(function() {
            var input = self.$('input[value="' + $(this).val() + '"]');
            input.prop('disabled', false);
            input.parent('li').addClass('disabled');
          });
        }
      }
    });
  }
});
