class CartsController < ApplicationController
	def index
		@products = Cart.all
	end

  def create
    product = Product.find(params[:product_id])
  	cart    = Cart.new
    cart.product = product
    cart.save! #add conditionals
  	redirect_to action: "index"
  end

  def cart_params
  	params.require(:cart).permit(:product)
  end
end
