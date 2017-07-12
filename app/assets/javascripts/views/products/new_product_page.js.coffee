class Store.Views.NewProductPage extends Backbone.View

	product: null
	model: null

	initialize: (options) ->
		@clickEdit = options.clickEdit
		@model = new Store.Models.Product()
		# $(".image-picker").imagepicker ({
		# 	changed: ->
		# })

	saveNewProduct: () ->
		@product = @clickEdit.product
		return if _.isEmpty @product

		@model.save @product,
			success: (res) ->
				console.log res