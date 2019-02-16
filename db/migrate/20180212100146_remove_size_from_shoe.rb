class RemoveSizeFromShoe < ActiveRecord::Migration[5.1]
  def change
    remove_column :shoes, :size, :integer
  end
end
