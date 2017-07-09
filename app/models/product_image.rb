class ProductImage < ApplicationRecord
	scope :thumbnail, -> { joins(:product).where( thumbnail: true ) }

	belongs_to :product
end
