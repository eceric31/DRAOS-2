class CreateJoinTableAddressPurchase < ActiveRecord::Migration[5.1]
  def change
    create_join_table :addresses, :purchases do |t|
      # t.index [:address_id, :purchase_id]
      # t.index [:purchase_id, :address_id]
    end
    add_foreign_key :addresses_purchases, :purchases
    add_foreign_key :addresses_purchases, :addresses
  end
end
