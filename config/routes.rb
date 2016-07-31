Rails.application.routes.draw do
	root to: 'products#index'

  get 'carts/create/:product_id', to: 'carts#create', as: "add_product_to_cart"

	devise_for :users
  resources :users
	resources :products
	resources :checkouts
	resources :carts, only: ['index', 'destroy']
	resources :orders, only: ['index']
end
