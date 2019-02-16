class AddSizeToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :size, :integer
  end
end
