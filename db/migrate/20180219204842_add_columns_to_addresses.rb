class AddColumnsToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :name, :string
    add_column :addresses, :telephone, :string
    add_column :addresses, :city, :string
    add_column :addresses, :zip, :string
    add_column :addresses, :region, :string
  end
end
