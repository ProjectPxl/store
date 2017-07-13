class Store.Routers.Carts extends Backbone.Router

	routes: 
		"cart" : "userCart"

	userCart: ->
		new Store.Views.CartsPage
			el: '.user-cart'
			collection: new Store.Collections.Carts()