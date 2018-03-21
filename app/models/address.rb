class Address < ApplicationRecord
    belongs_to :user
    belongs_to :country
    belongs_to :addressType, optional: true
end
