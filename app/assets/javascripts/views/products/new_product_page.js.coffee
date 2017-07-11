class Store.Views.NewProductPage extends Backbone.View

	product: null

	initialize: (options) ->
		@clickEdit = options.clickEdit

		# $(".image-picker").imagepicker ({
		# 	changed: ->
		# })

	saveNewProduct: () ->
		@product = @clickEdit.product
		return if _.isEmpty @product

		$.create '/admin/products', {product: @product}, (res) ->
			console.log res