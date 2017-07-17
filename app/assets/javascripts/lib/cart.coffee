class Cart
	constructor: ->
		$(document).on 'click', '.js-add-cart', ->
			p = $('[data-product-id]').data('product-id')
			q = parseInt( $('.qty-box .qty').text() )
			
			store.set( "cartProduct-#{p}", q )
			
			$(document).trigger 'product:addCart'

	getCartCount: ->
		count = 0
		store.each (value, key) =>
			if key.indexOf('cartProduct-') isnt -1
				count++
		count

	getItems: ->
		items = {}
		store.each (value, key) =>
			if key.indexOf('cartProduct-') isnt -1
				items[key] = value
		items

window.Cart = new Cart