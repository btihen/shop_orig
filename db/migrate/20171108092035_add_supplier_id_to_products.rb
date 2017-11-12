class AddSupplierIdToProducts < ActiveRecord::Migration[5.1]
  def change
    # add_reference :products, :supplier, foreign_key: true, index: true
  end
end
