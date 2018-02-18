class AddShoeToPurchaseDetail < ActiveRecord::Migration[5.1]
  def change
    add_reference :purchase_details, :shoe, foreign_key: true
  end
end
