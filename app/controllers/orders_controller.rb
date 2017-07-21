class OrdersController < ApplicationController
  
  def confirmation
  	if params[:confirmation].present?
  	  @order = Order.open.find_by_confirmation( params[:confirmation] )
  	  if @order.nil?
  	    redirect_to root_path
  	  end
  	else
  	  redirect_to root_path
  	end

  end

end
