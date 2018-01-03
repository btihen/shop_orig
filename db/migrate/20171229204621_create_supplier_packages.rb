class CreateSupplierPackages < ActiveRecord::Migration[5.1]
  def change
    create_table :supplier_packages do |t|
      # t.references :product, foreign_key: true
      # t.references :included_product, foreign_key: true
      t.references :product,          index: true, foreign_key: true
      t.references :included_product, index: true
      t.integer    :included_quantity, null: false

      t.timestamps null: false
    end

    add_foreign_key :supplier_packages, :products, column: :included_product_id
    add_index :supplier_packages, [:product_id, :included_product_id], unique: true
  end
end
