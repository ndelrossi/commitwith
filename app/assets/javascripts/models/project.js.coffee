class App.Models.Project extends Backbone.Model

  initialize: ->
    @repo = new App.Models.Repo({id: "/" + @get("author") + "/" + @get("title")})
    @repo.fetch({
      success: (data) =>
        @set({
          language: @repo.get("language"),
          description: @repo.get("description")
          owner: @repo.get("owner").login
          open_issues_count: @repo.get("open_issues_count")
          size: @repo.get("size")
          last_update: @repo.get("updated_at")
        })
    })
