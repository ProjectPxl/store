window.Store =
Models: {}
Collections: {}
Views: {}
Routers: {}
initialize: ->
  new Store.Routers.Products()
  new Store.Routers.Carts()
  new Store.Routers.Checkouts()
  Backbone.history.start(pushState: true)

$(document).ready ->
  Store.initialize()