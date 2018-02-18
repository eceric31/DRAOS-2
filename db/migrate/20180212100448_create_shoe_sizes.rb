class CreateShoeSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoe_sizes do |t|
      t.integer :size

      t.timestamps
    end
  end
end
