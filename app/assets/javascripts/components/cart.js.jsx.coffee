@CartComponent = React.createClass
	render: ->
		`<a href="/cart">Cart ( {this.state.count} )</a>`

	getInitialState: ->
		$(document).on 'product:addCart', @addToCart
		count: Cart.getCartCount()

	addToCart: ->
		@setState
			count: ++@state.count
