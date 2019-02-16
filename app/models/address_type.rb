class AddressType < ApplicationRecord
    has_many :addresses, dependent: :destroy
end
