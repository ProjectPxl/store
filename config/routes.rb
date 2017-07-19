Rails.application.routes.draw do

	root to: 'store#index'

  get 'carts/create/:product_id', to: 'carts#create', as: "add_product_to_cart"

	devise_for :users
	resources :users

	get '/products/:id', to: 'products#show', as: 'product'

	# resources :checkouts

	get '/carts', to: 'carts#show'

	scope 'carts/:t' do
	  get 'checkout', :to => 'checkouts#index'
	end

	get '/carts/cart_count', to: 'carts#cart_count'
	resources :carts, only: [:index, :create]


	resources :cart_items, only: :create

	namespace :admin do
		root to: 'dashboards#index'
	  resources :dashboards
	  resources :products, except: :show
	  resources :orders, only: ['index']
	end
end
