class AddCategoryToShoe < ActiveRecord::Migration[5.1]
  def change
    add_reference :shoes, :category, foreign_key: true
  end
end
