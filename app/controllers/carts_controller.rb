class CartsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  respond_to :html, :json

	def index #generates a token per user for LS
		respond_with Cart.create cart_params
	end

	def show #shows cart based on token
		if params[:t].present?
			@cart = Cart.find_by_token params[:t] #token
		else
			nil
		end

	end

	def create #adds items to cart
		product  = Product.find params[:product_id]
		cart 	 	 = Cart.find_or_create_by token: params[:token]
		@item 	 = CartItem.find_by_product_id_and_cart_id( product.id, cart.id )
		exists 	 = false
		
		if @item.nil? #increment qty of existing item or create new
			@item = CartItem.create! cart: cart, product: product, quantity: params[:quantity]
			cart.cart_items << @item
		else
			@item.update quantity: @item.quantity + params[:quantity]
			exists = true
		end
		
	  render json: {item: @item, exists: exists}
	  # make sure model is in sync with client cart+token
	end

	def cart_count
		cart = Cart.find_by_token params[:token]
		respond_with cart.products.count
	end

	private
	def record_not_found error
		render :json => {:error => error.message}, :status => :not_found
	end

	def cart_params
	  params.require(:cart).permit(:token)
	end
end
