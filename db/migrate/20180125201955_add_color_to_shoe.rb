class AddColorToShoe < ActiveRecord::Migration[5.1]
  def change
    add_reference :shoes, :color, foreign_key: true
  end
end
