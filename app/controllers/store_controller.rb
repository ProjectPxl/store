class StoreController < ApplicationController
  def index
  	@collections = Collection.all
  end
end
