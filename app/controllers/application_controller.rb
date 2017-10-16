class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :header_collections

  def header_collections
  	@collections = Collection.all
  end
end
