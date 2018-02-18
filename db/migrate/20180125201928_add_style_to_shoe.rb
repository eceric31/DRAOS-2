class AddStyleToShoe < ActiveRecord::Migration[5.1]
  def change
    add_reference :shoes, :style, foreign_key: true
  end
end
