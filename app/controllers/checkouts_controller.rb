class CheckoutsController < ApplicationController
  respond_to :html, :json

  def show
    if params[:token].present?
      @cart = Cart.find_by_token params[:token]
      if @cart.nil? or @cart.cart_items.any? == false
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def create
    cart = Cart.find_by_token params[:token]
    #error if cart.nil?
    total  = Cart.total cart
    order  = Order.new

    order.build_shipping_address shipping_params
    order.build_billing_address billing_params
    cart.cart_items.each do |i|
      order.order_items.build( product: i.product, quantity: i.quantity)
    end
    order.stripe_token = params[:stripe_token]
    order.status = "Placed"
    order.user = current_user #change to guest user

    if !order.save
      raise order.errors.full_messages.inspect
      #handle save error
      return
    end

  	begin
  	  charge = Stripe::Charge.create(
  	    amount:      100,
  	    source:      params[:stripe_token],
        currency:    "usd",
  	    description: "new charge: #{total}"
  	  )

      if charge['paid'] #probably redundant
        cart.destroy
      end

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
