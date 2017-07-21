class Admin::OrdersController < Admin::DashboardsController
  def index
    @orders = Order.all
  end

  def confirmation
  	raise params.inspect
  	if params[:confirmation].present?
  	  @order = Order.find_by_confirmation( params[:confirmation] ).open
  	  if @order.nil?
  	    redirect_to root_path
  	  end
  	else
  	  redirect_to root_path
  	end

  end

  def product_params
    params.require(:product).permit(:user)
  end
end
