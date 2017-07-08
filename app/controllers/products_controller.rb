class ProductsController < ApplicationController
	layout 'product', only: [:show, :new]
  respond_to :html, :json

  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find params[:id]
  end

  def new
    @product = Product.new
  end

  def create
    respond_with Product.create(product_params)
  end

  def update
    @product = Product.find(params[:id])
    respond_with @product.update(product_params)
  end

  def product_params
  	params.require(:product).permit(:name, :price, :description)
  end
end
