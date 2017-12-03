class AddUniquneSupplierNameToSuppliers < ActiveRecord::Migration[5.1]
  def change
    add_index :suppliers, :supplier_name, unique: true
  end
end
