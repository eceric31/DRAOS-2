class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoes do |t|
      t.string :model
      t.text :description
      t.integer :size
      t.float :price
      t.boolean :gender

      t.timestamps
    end
  end
end
