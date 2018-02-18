class OrderItem < ApplicationRecord
  belongs_to :shoe
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :size, presence: true

  before_save :finalize

  def price
    if persisted?
      self[:price]
    else
      shoe.price
    end
  end

private

  def finalize
    self[:price] = price
  end
end
