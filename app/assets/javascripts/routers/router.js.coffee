class Store.Routers.Router extends Backbone.Router
	
	views: {}

	routes:
		"carts/(:token)/checkout" : "index"
		"products/:id"            : "show"
		"admin/products/new" 			:	"new"
		"admin/products/:id/edit" : "edit"

	index: (token) =>
		@views['view1'] = new Store.Views.CheckoutsPage 
			el: '.checkout'
			model: new Store.Models.Checkout()

	close: ->
		for k,view of @views
			view.close()

	show: (id) ->
		@views['view1'] = new Store.Views.ProductsPage
			el        : '.product-page'
			productId : id

	edit: (id) ->
		@views['view1'] = new Store.Views.ProductsPage
			el         : '.product-page'
			productId  : id

	new: () -> 
		@views['view1'] = new Store.Views.ProductsPage
			el : '.product-page'