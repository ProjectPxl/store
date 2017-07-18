class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :token

      t.timestamps
    end
    add_index :carts, :token
  end
end
