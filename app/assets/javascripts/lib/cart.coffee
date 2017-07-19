class Cart
	constructor: ->
		$(document).on 'click', '.js-add-cart', =>
			p = $('[data-product-id]').data('product-id')
			q = parseInt( $('.qty-box .qty').text() )
			
			token = store.get('token')
			if token and token.length
				@addToCart(token, p, q)
			else			
				token = store.set "token", @generateToken() 
				@addToCart(token, p, q)

	addToCart: (token, pid, qty) ->
		model = new Store.Models.Cart()
		params = 
			token: token
			product_id: pid
			quantity: qty

		model.save params,
			success: (model, res) ->
				if res.exists == false
					$(document).trigger 'product:addCart'
				# TODO: esle notify: qty updated
			error: (model, res) ->
				#stringify json
				store.remove('token')

	hasToken: ->
		token = store.get('token')
		if token and token.length then true else false

	getToken: ->
		if @hasToken()
			store.get('token')

	getItems: ->
		items = {}
		store.each (value, key) =>
			if key.indexOf('cartProduct-') isnt -1
				items[key] = value
		items

	generateToken: ( length = 24 )->
		id = ""
		id += Math.random().toString(36).substr(2) while id.length < length
		id.substr 0, length

window.Cart = new Cart