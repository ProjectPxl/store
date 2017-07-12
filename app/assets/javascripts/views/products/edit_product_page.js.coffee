class Store.Views.EditProductPage extends Backbone.View

	product   : null
	clickEdit : null
	productId : null

	initialize: (options) ->
		@clickEdit  = options.clickEdit
		@productId  = options.productId
		
		@model = new Store.Models.Product()
		currentProduct = $(@el).find('.js-product').data('product')
		if currentProduct.id #add fallback if model empty
			@model.set currentProduct

	updateProduct: ->
		@product = @clickEdit.product
		return if _.isEmpty @product

		@model.save @product,
			success: (res) ->
				console.log res