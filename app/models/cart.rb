class Cart < ApplicationRecord
	belongs_to :product

	def self.get_charge_amount items
		amount = 0
		items.each do |item|
			amount += item.product.price
		end
		amount
	end
end
