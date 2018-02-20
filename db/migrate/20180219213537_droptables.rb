class Droptables < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :city_id
    drop_table :cities
    drop_table :addresses_people
    drop_table :people
    drop_table :addresses_purchases

  end
end
