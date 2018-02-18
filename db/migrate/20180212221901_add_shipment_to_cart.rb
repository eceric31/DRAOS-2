class AddShipmentToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :shipment, :float
  end
end
