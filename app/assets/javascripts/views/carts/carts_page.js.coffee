class Store.Views.CartsPage extends Backbone.View

	template: JST['carts/index']

	initialize: ->
		@model = new Store.Models.Cart()
		@listenTo @model, 'sync', @render

		store.each (value, key) =>
			if key.indexOf('cartProduct-') isnt -1
				@model.set( id: key.split('-')[1] )
				@collection.add @model
				@model.fetch()

		@render

	render: (product) ->
		@$el.append @template(p: product) 
		@