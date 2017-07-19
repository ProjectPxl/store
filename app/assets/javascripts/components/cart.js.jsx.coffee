@CartComponent = React.createClass
	render: ->
		`<a href={ "/carts?t="+this.state.token }>Cart ( {this.state.count} )</a>`

	getInitialState: ->
		$(document).on 'product:addCart', @addToCart
		{
			count: 0
			token: ''
		}
		
	componentDidMount: ->
		if Cart.hasToken()	
			token = Cart.getToken()
			$.get '/carts/cart_count.json', token: token, (count) =>
				if @isMounted()
					@setState 
						count: count
						token: token

	addToCart: ->
		@setState
			count: ++@state.count
			token: Cart.getToken()
