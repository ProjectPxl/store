class Cart < ApplicationRecord
	has_many :cart_items
	has_many :products, through: :cart_items

	after_destroy :destroy_cart_items

	def self.total cart
		total = 0
		cart.cart_items.each { |i| puts total += i.product.price * i.quantity }
		total
	end

	private

	def destroy_cart_items
		self.cart_items.each do |item|
	    item.destroy
		end
	end

end
