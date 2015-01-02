class App.Models.Project extends Backbone.Model

  initialize: ->
    self = this
    @repo = new App.Models.Repo({id: "/" + @get("author") + "/" + @get("title")})
    @repo.fetch({
      success: (data) ->
        self.set({language: self.repo.get("language")})
    })
