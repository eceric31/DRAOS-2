class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.float :subtotal
      t.float :shipping
      t.references :order_status, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
