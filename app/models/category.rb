class Category < ApplicationRecord
    has_many :shoes, dependent: :destroy
end
