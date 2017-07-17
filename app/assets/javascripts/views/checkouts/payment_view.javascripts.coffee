class Store.Views.PaymentView extends Backbone.View

	events:
		'click .js-billing-same' 	 : 'toggleBilling'

	template : JST['checkouts/payment']
	cardForm : null

	initialize: (options) ->
		@render()
		@cardForm = @$el.find('#card-form')

	render: ->
		@$el.find('#payment-info').html @template

	collapse: (action) ->
		@$el.find('#collapsePayment').collapse action

	isBillingChecked: ->
		@$el.find('.js-billing-same').is(':checked')

	toggleBilling: (event) ->
		if @isBillingChecked()
			@$el.find('.billing-address').addClass('hide')
		else
			@$el.find('.billing-address').removeClass('hide')