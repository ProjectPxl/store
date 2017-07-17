class Store.Views.ShippingView extends Backbone.View

	events:
		'click .js-save-shipping' : 'saveShipping'

	template: JST['checkouts/shipping']
	form: null

	initialize: (options) ->
		@render()
		@form = @$el.find('#shipping-form')

	render: ->
		@$el.find('#shipping-info').html @template

	saveShipping: (event) ->
		data = {}
		@form.serializeArray().map( (x)-> data[x.name] = x.value ) 
		@model.set data
		false

	collapse: (action)->
		@$el.find('#collapseShipping').collapse action