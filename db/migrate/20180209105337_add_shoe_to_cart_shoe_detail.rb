class AddShoeToCartShoeDetail < ActiveRecord::Migration[5.1]
  def change
    add_reference :cart_shoe_details, :shoe, foreign_key: true
  end
end
