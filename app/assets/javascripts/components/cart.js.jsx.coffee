@CartComponent = React.createClass
	render: ->
		`<a href="/cart">Cart ( {this.state.count} )</a>`

	getInitialState: ->
		$(document).on 'product:addCart', @addToCart
		count: @props.count	

	addToCart: ->
		@setState
			count: ++@state.count
