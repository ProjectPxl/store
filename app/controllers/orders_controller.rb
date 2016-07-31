class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def product_params
    params.require(:product).permit(:user)
  end
end
