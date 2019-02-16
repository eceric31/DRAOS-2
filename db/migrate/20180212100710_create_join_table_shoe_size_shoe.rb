class CreateJoinTableShoeSizeShoe < ActiveRecord::Migration[5.1]
  def change
    create_join_table :shoe_sizes, :shoes do |t|
      # t.index [:shoe_size_id, :shoe_id]
      # t.index [:shoe_id, :shoe_size_id]
    end
    add_foreign_key :shoe_sizes_shoes, :shoes
    add_foreign_key :shoe_sizes_shoes, :shoe_sizes
  end
end
