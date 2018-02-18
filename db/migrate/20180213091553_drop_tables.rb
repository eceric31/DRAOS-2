class DropTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :carts, force: :cascade
    drop_table :cart_shoe_details, force: :cascade
    drop_table :purchases, force: :cascade
    drop_table :purchase_details, force: :cascade
  end
end
