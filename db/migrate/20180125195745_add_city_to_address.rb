class AddCityToAddress < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :city, foreign_key: true
  end
end
