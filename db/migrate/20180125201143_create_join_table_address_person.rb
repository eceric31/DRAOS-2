class CreateJoinTableAddressPerson < ActiveRecord::Migration[5.1]
  def change
    create_join_table :addresses, :people do |t|
      # t.index [:address_id, :person_id]
      # t.index [:person_id, :address_id]
    end
    add_foreign_key :addresses_people, :people
    add_foreign_key :addresses_people, :addresses
  end
end
