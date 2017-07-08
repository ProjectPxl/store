class ChangeDescriptionTypeInProducts < ActiveRecord::Migration[5.0]
	def self.up
	   change_column :products, :description, :text
	end
end
