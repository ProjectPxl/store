class CreateBillingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :billing_addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.string :postal
      t.string :country
      t.string :company
      t.string :phone

      t.integer :order_id

      t.timestamps
    end
  end
end
