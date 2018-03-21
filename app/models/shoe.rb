class Shoe < ApplicationRecord
    belongs_to :style
    belongs_to :brand
    belongs_to :color
    belongs_to :category
    has_and_belongs_to_many :shoe_sizes
    has_many :cart_shoe_details
    has_many :carts, through: :cart_shoe_details
    has_many :order_items, dependent: :destroy
end
