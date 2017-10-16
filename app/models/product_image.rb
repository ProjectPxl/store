class ProductImage < ApplicationRecord
	scope :thumbnail, -> { joins(:product).where( thumbnail: true ).first }

	belongs_to :product
end
