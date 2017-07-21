class Order < ApplicationRecord
	belongs_to :user

	has_many :order_items
	has_one :shipping_address
	has_one :billing_address

	scope :open, -> { where(closed: false) }

	def self.generate_confirmation
		SecureRandom.hex(5)
	end
end
