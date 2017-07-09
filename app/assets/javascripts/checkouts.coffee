$(document).ready ->	
	$('.js-clickEdit').clickEdit()
	$(".image-picker").imagepicker ({
		changed: ->
			debugger
	})

	$('.js-add-cart').click ->
	

		$.get( "/carts/create/2")
	  .done (data)->
	  	$(document).trigger 'product:addCart', data
	  .fail (error)->
	  	debugger
	
	# stripeResponseHandler = (status, response) ->
	# 	$form = $('#payment-form')

	# 	if (response.error)
	#     $form.find('.payment-errors').text(response.error.message);
	#     $form.find('.submit').prop('disabled', false); 
	#   else
	#     token = response.id;

	#     $form.append($('<input type="hidden" name="stripeToken">').val(token));

	#     $form.get(0).submit();  

	# $form = $('#payment-form')
	# $form.submit (event) ->
	# 	$form.find('.submit').prop('disabled', true)
	# 	Stripe.card.createToken($form, stripeResponseHandler)
	# 	false