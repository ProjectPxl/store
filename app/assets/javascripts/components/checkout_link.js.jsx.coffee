@CheckoutLinkComponent = React.createClass
	render: ->
		`<a href={"/carts/checkouts/"+Cart.getToken()}>Checkout</a>`