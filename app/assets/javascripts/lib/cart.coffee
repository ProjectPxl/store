class Cart
	constructor: ->
		$('.js-add-cart').click ->
			p = $('[data-product-id]').data('product-id')
			q = parseInt( $('.qty-box .qty').text() )
			
			store.set( "cartProduct-#{p}", q )
			
			$(document).trigger 'product:addCart'

window.Cart = Cart