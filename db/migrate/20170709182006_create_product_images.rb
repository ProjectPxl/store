class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
      t.string :name
      t.integer :product_id
      t.boolean :thumbnail, default: false

      t.timestamps
    end
  end
end
