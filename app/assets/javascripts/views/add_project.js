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
      title: this.repo.get('name'),
      author: this.repo.get('owner').login,
      description: this.repo.get('description'),
      languages: this.repo.get("language"),
      size: this.repo.get("size"),
      open_issues: this.repo.get("open_issues_count"),
      category: this.$("#multi-select-category").val().toString(),
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

  setUpMultiSelects: function() {
    var self = this;
    this.$('#multi-select-category').multiselect({
      nonSelectedText: 'Select up to 3 categories',
      buttonWidth: '100%',
      onChange: function(option, checked) {
        var selectedOptions = self.$('#multi-select-category option:selected');
 
        if (selectedOptions.length >= 3) {
          // Disable all other checkboxes.
          var nonSelectedOptions = self.$('#multi-select-category option').filter(function() {
            return !$(this).is(':selected');
          });
 
          var dropdown = self.$('#milti-select').siblings('.multiselect-container');
          nonSelectedOptions.each(function() {
            var input = self.$('input[value="' + $(this).val() + '"]');
            input.prop('disabled', true);
            input.parent('li').addClass('disabled');
          });
        }
        else {
          // Enable all checkboxes.
          var dropdown = self.$('#multi-select-category').siblings('.multiselect-container');
          $('#multi-select-category option').each(function() {
            var input = self.$('input[value="' + $(this).val() + '"]');
            input.prop('disabled', false);
            input.parent('li').addClass('disabled');
          });
        }
      }
    });
  }
});
