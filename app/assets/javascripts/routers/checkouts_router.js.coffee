class Store.Routers.Checkouts extends Backbone.Router
	routes:
		'carts/(:token)/checkout' : 'index'

	index: (token) ->
		new Store.Views.CheckoutsPage 
			el: '.checkout'
			model: new Store.Models.Checkout()