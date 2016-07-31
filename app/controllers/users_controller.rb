class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @orders = current_user.orders
  end
end
