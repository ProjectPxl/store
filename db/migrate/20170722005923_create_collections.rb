class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :display_name
      t.string :image

      t.timestamps
    end
  end
end
