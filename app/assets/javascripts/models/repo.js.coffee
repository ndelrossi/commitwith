class App.Models.Repo extends Backbone.Model
  urlRoot: 'https://api.github.com/repos'

  url: ->
    url = this.urlRoot + this.id
