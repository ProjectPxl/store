window.Store =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	new Store.Routers.Products()
  	new Store.Routers.Carts()
  	Backbone.history.start({pushState: true});

$(document).ready ->
  Store.initialize()