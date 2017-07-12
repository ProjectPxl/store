window.Store =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	new Store.Routers.Products()
  	Backbone.history.start({pushState: true});

$(document).ready ->
  Store.initialize()
