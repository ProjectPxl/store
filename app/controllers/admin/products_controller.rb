class Admin::ProductsController < Admin::DashboardsController
  before_action :authenticate_user!
  before_action :get_product, only: [:edit, :update]
  before_action :get_images, only: :edit
  before_action :get_all_images, only: [:edit, :new]
  respond_to :html, :json

  def index
  	@products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    respond_with Product.create(product_params)
  end

  def edit
  end

  def update
    respond_with @product.update(product_params)
  end

  private

  def product_params
  	params.require(:product).permit(:name, :price, :description)
  end

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
