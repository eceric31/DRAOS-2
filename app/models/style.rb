class Style < ApplicationRecord
    has_many :shoes, dependent: :destroy
end
