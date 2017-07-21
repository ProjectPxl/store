class AddConfirmationToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :confirmation, :string
    add_column :orders, :closed, :boolean, default: false
  end
end
