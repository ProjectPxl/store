@Cart = React.createClass
  render: ->
  	`<a href="/carts">Cart ( {this.state.count} )</a>`

  getInitialState: ->
  	$(document).on 'sdfewf', @addCart
  	count: @props.count	

  addCart: (event, count) ->
  	this.setState({
  		count: 100
  	})
  		