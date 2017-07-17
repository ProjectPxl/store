class CheckoutsController < ApplicationController
  respond_to :html, :json

  def index
    @amount = Cart.get_charge_amount current_user.carts  
  end

  def create
    cart    = current_user.carts
    amount  = Cart.get_charge_amount cart
    order   = Order.create(user: current_user, status: "Placed")

    cart.each do |i|
      OrderItem.create(order: order, product: i.product, quantity: 1)
    end

    Cart.clear_users_cart

  	begin
  	  charge = Stripe::Charge.create(
  	    :amount => amount,
  	    :currency => "usd",
  	    :source => params[:stripeToken],
  	    :description => "new charge: #{amount}"
  	  )
  	rescue Stripe::CardError => e
  	  # The card has been declined
  	end

  end
  
end
