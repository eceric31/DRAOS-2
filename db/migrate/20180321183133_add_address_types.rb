class AddAddressTypes < ActiveRecord::Migration[5.1]
  def change
    rename_column :address_types, :type, :address_type
    AddressType.create(id: 1, address_type: "delivery")
    AddressType.create(id: 2, address_type: "billing")
  end
end
