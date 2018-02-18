class Address < ApplicationRecord
    has_and_belongs_to_many :purchases
    has_and_belongs_to_many :people
    belongs_to :city
    belongs_to :addressType
end
