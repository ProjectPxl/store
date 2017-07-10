class Store.Views.ProductsPage extends Backbone.View
	events: 
		'click .js-save' : 'saveProduct'
	
	initialize: (options) ->
		console.log 'init'
		# init children views
		if options.children
			_.each options.children, (View) ->
				new View()

		# init model
		@model = new Store.Models.Product()

	saveProduct: (event) ->
		debugger
		# return if Object.keys( @product ).length is 0

		# @product.price = parseFloat @product.price if @product.price
		# @product.name  = @product.name.trim() if @product.name
		# url = if @action is 'create' then '/products' else "/products/#{@id}"

		# $[@action] url, 
		# 	{ @product },
		# 	(response) =>
		# 		@product = {}
		# 		console.log response