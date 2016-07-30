class CheckoutsController < ApplicationController
  def create
  	token = params[:stripeToken]
    amount = Cart.get_charge_amount Cart.all
  	begin
  	  charge = Stripe::Charge.create(
  	    :amount => amount,
  	    :currency => "usd",
  	    :source => token,
  	    :description => "charge: #{amount}"
  	  )
  	rescue Stripe::CardError => e
  	  # The card has been declined
  	end

  end
end
