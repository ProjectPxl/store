Rails.application.routes.draw do

	root to: 'store#index'

  get 'carts/create/:product_id', to: 'carts#create', as: "add_product_to_cart"

	devise_for :users
	resources :users

	get '/products/:id', to: 'products#show', as: 'product'

	resources :checkouts
	resources :cart, only: ['index', 'destroy']

	namespace :admin do
		root to: 'dashboards#index'
	  resources :dashboards
	  resources :products, except: :show
	  resources :orders, only: ['index']
	end
end
