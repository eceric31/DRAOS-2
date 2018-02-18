class Order < ApplicationRecord
  belongs_to :order_status
  belongs_to :user
  has_many :order_items

  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.price) : 0 }.sum
  end
private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
