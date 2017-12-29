class AddSupplierToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :supplier, foreign_key: true, index: true
    # add_index     :products, [:product_name, :supplier],  unique: true
    # add_index     :products, :product_name
  end
end
