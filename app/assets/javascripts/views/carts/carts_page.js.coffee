class Store.Views.CartsPage extends Backbone.View

	template: JST['carts/index']

	initialize: ->
		@listenTo @collection, 'sync', @render

		store.each (value, key) =>
			if key.indexOf('cartProduct-') isnt -1
				model = new Store.Models.Cart()
				model.set
					id: key.split('-')[1] 
					qty: value
				@collection.add model
				console.log 'val', value
				model.fetch()

		@render

	render: (product) ->
		console.log 'r', product.get('qty')
		@$el.append @template(p: product) 
		@