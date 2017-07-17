class CheckoutsController < ApplicationController
  respond_to :html, :json

  def index
  end

  def create
    total  = Product.total params[:cart]
    raise total.inspect
    return
    order = Order.new

    order.build_shipping_address shipping_params
    order.build_billing_address billing_params
    order.user = current_user #change to guest user
    order.stripe_token = params[:stripeToken]

    if order.save
      raise order.inspect
      return
      # cart.each do |i|
      #   OrderItem.create(order: order, product: i.product, quantity: 1)
      # end
    else
      #handle save error
    end

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

  def shipping_params
    params.require(:shipping_address).permit(:address_1, :address_2, :first_name, :last_name,
     :city, :state, :postal, :country, :company, :phone)
  end

  def billing_params
    params.require(:billing_address).permit(:address_1, :address_2, :first_name, :last_name,
     :city, :state, :postal, :country, :company, :phone)
  end
  
end
