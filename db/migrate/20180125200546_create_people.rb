class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.string :telephone

      t.timestamps
    end
  end
end
