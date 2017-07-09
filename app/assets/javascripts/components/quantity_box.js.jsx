var QuantityBox = React.createClass({
  getInitialState: function() {
    return { value: 1 };
  },
  onDecrement: function(e) {
    if (this.state.value <= 1) return;
    this.setState({value: --this.state.value});
  },
  onIncrement: function(e) {
    this.setState({value: ++this.state.value});
  },    
  render: function() {
    return (
      <div className="qty-box">
        <span className="dec" onClick={this.onDecrement} onTouchStart={this.onDecrement}>–</span>
        <span className="qty">{this.state.value}</span>
        <span className="inc" onClick={this.onIncrement} onTouchStart={this.onIncrement}>+</span>
      </div>
    );
  }
});