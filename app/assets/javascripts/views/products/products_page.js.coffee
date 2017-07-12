class Store.Views.ProductsPage extends Backbone.View
	events: 
		'click .js-create' : 'createProduct'
		'click .js-update' : 'updateProduct'
	
	initialize: (options) ->
		clickEdit = new ClickEdit()
		# init model
		# @model = new Store.Models.Product()
		
		# init children views
		@newProductView = new Store.Views.NewProductPage
			model: @model
			clickEdit: clickEdit

		@editProductView = new Store.Views.EditProductPage
			el: '.product-page'
			model: @model
			clickEdit: clickEdit
			productId: options.productId

	createProduct: (event) =>
		@newProductView.saveNewProduct()

	updateProduct: (event) =>
		@editProductView.updateProduct()