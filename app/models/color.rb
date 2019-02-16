class Color < ApplicationRecord
    has_many :shoes, dependent: :destroy
end
