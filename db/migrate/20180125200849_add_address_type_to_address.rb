class AddAddressTypeToAddress < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :address_type, foreign_key: true
  end
end
