class Product < ApplicationRecord
	has_many :orders
	has_many :users, through: :orders, :source => :order

	has_many :product_collections
	has_many :collections, through: :product_collections

	has_many :product_categories
	has_many :categories, through: :product_categories

	has_many :order_items
	has_many :product_images
end
