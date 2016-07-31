class CartsController < ApplicationController
	def index
		@products = current_user.carts
	end

  def create
    product = Product.find(params[:product_id])
  	cart    = Cart.new
    cart.product = product
    cart.user    = current_user
    cart.save! #add conditionals
  	redirect_to action: "index"
  end

  def destroy
    Cart.find_by_product_id_and_user_id(params[:id], current_user.id).destroy
    redirect_to :back
  end

  def cart_params
  	params.require(:cart).permit(:product)
  end
end
