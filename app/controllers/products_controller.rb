class ProductsController < ApplicationController
  before_action :get_product, only: :show
  before_action :get_images, only: :show
	layout 'product'

  def index
  	@products = Product.all
  end

  def show
  end

  private

  def get_product
    @product = Product.find params[:id]
  end

  def get_images
    @images = @product.product_images
  end

  def get_all_images
    @all_product_images = Dir.glob("app/assets/images/product_images/*.jpg")
  end
end
