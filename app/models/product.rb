class Product < ApplicationRecord
	has_many :carts
	has_many :users, through: :carts, :class_name => 'Cart', 
                                    :foreign_key => 'user_id',
                                    :source => :cart

	has_many :orders
	has_many :users, through: :orders, :source => :order

	has_many :order_items
	has_many :product_images
end
