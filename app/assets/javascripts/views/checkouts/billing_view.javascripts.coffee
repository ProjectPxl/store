class Store.Views.BillingView extends Backbone.View

	template: JST['checkouts/billing']

	initialize: (options) ->
		@render()

	render: ->
		@$el.html @template

	collapse: (action)->
		@$el.find('#collapseBilling').collapse action