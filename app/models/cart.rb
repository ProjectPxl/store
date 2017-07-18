class Cart < ApplicationRecord
	has_many :cart_items
	has_many :products, through: :cart_items

	def self.generate_token
		 SecureRandom.base64(12).downcase
	end
end
