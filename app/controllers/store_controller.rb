class StoreController < ApplicationController
  def index
  	@featured_products = Category.find_by_name 'featured'
  end
end
