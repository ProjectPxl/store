class Cart < ApplicationRecord
	belongs_to :product
	belongs_to :user

	def self.get_charge_amount items
		amount = 0
		items.each do |item|
			amount += item.product.price
		end
		amount
	end

	def self.clear_users_cart
		current_user.carts
	end
end
