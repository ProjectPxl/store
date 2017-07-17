class Product < ApplicationRecord
	has_many :orders
	has_many :users, through: :orders, :source => :order

	has_many :order_items
	has_many :product_images

	def self.total items
		total = 0
		items.each do |k,v| # cartProduct-[id] : quantity
			id = k.split("-")[1] #check for errors
			p = Product.find(id)
			if p.id
				total += p.price.to_f #use money gem
			end
		end
		total
	end

end
