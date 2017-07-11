class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :get_cart_count

  def get_cart_count
  	# current_user.carts.count if current_user
  end
end
