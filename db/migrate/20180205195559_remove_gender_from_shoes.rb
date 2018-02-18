class RemoveGenderFromShoes < ActiveRecord::Migration[5.1]
  def change
    remove_column :shoes, :gender, :boolean
  end
end
