class AddPurchaseToPurchaseDetail < ActiveRecord::Migration[5.1]
  def change
    add_reference :purchase_details, :purchase, foreign_key: true
  end
end
