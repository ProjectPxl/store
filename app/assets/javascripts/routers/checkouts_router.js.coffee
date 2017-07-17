class Store.Routers.Checkouts extends Backbone.Router
	routes:
		'checkouts' : 'index'

	index: ->
		new Store.Views.CheckoutsPage 
			el: '.checkout'
			model: new Store.Models.Checkout()