class Store.Views.EditProductPage extends Backbone.View

	product   : null
	clickEdit : null
	productId : null

	initialize: (options) ->
		@clickEdit = options.clickEdit
		@productId = options.productId

	updateProduct: ->
		@product = @clickEdit.product
		return if _.isEmpty @product

		$.update "/products/#{@productId}", {product: @product}, (res) ->
			console.log res