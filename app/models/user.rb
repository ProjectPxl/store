class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :products, through: :carts, :class_name => 'Cart', 
                                    	 :foreign_key => 'product_id',
                                    	 :source => :cart

  has_many :orders
  has_many :products, through: :orders, source: :order
end
