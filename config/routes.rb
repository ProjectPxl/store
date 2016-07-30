Rails.application.routes.draw do
	root to: 'products#index'

	get 'cart', to: 'carts#index'
  get 'carts/create/:product_id', to: 'carts#create', as: "add_product_to_cart"

	resources :products
	resources :checkouts
end
