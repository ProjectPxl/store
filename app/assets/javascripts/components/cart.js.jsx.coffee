@Cart = React.createClass
  render: ->
    `<a href="/carts">Cart ( {this.state.count} )</a>`

  getInitialState: ->
    $(document).on 'product:addCart', @addToCart
    count: @props.count	

  addToCart: (event, count) ->
    @setState
      count: ++@state.count
