@CheckoutLinkComponent = React.createClass
	render: ->
		`<a href={"/carts/"+Cart.getToken()+"/checkout"}>Checkout</a>`