class Product < ApplicationRecord
	has_many :orders
	has_many :users, through: :orders, :source => :order

	has_many :order_items
	has_many :product_images
end
