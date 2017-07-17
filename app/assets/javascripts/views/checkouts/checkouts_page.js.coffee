class Store.Views.CheckoutsPage extends Backbone.View

	events:
		'click .js-complete-order' : 'getBillingAddress'

	shippingModel: null
	billingModel: null 
	stripeModel: null 

	template: JST['checkouts/index']

	initialize: () ->
		@shippingModel = new Store.Models.Shipping()
		@billingModel  = new Store.Models.Billing()
		@stripeModel   = new Store.Models.Stripe()
		
		@shippingView = new Store.Views.ShippingView
			el: '.shipping-address'
			model: @shippingModel

		@paymentView = new Store.Views.PaymentView
			el: '.payment-method'
		
		@billingView = new Store.Views.BillingView
			el: '.billing-address'
			model: @billingModel

		@shippingView.collapse 'show'

		@listenTo @shippingModel, 'change',  @shippingDone
		@listenTo @billingModel,  'change',  @billingDone
		@listenTo @stripeModel,   'change',  @stripeDone
		@listenTo @model,   			'save', (res) ->
			debugger

	shippingDone: (model) ->
		# move to payment view
		@shippingView.collapse 'hide'
		@paymentView.collapse 'show'

	billingDone: (model) ->
		#once shipping + billing are obtained => process payment
		@getStripeToken model

	stripeDone: (model) ->
		params = 
			shipping_address : @shippingModel.attributes
			billing_address  : @billingModel.attributes
			stripe_token     : @stripeModel.get('token')
		@model.save params, {
			success: (res) ->
				debugger
			error: (res) ->
				debugger
		}

	getStripeToken: (billingModel) ->
		Stripe.createToken({
			number  				: $('[data-stripe="number"]').val()
			cvc 						: $('[data-stripe="cvc"]').val()
			exp_month				: $('[data-stripe="exp-month"]').val()
			exp_year 				: $('[data-stripe="exp-year"]').val()
			name 						: "#{ @billingModel.get('first_name') } #{ @billingModel.get('last_name') }"
			address_line1 	: @billingModel.get('address_1')
			address_line2 	: @billingModel.get('address_2')
			address_city  	: @billingModel.get('city')
			address_state 	: @billingModel.get('state')
			address_zip 		: @billingModel.get('postal')
			address_country : @billingModel.get('country')
		}, @stripeResponseHandler) #add billing info to 1st param.

	stripeResponseHandler: (status, response) =>
		if (response.error)
			@$el.find('#card-form').find('.payment-errors').text(response.error.message);
			@$el.find('#card-form').find('button').prop('disabled', false); 
		else
			@stripeModel.set token: response.id

	getBillingAddress: ->
		# @cardForm.find('button').prop('disabled', true)
		if @isBillingChecked()
			@billingModel.set @shippingModel.attributes
		else
			data = {}
			@$el.find('#billing-form').serializeArray().map( (x)-> data[x.name] = x.value ) 
			@billingModel.set data
		false

	isBillingChecked: ->
		@$el.find('.js-billing-same').is(':checked')