class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.string :product_category_name
      t.references :tax_category, foreign_key: true

      t.timestamps
    end
    add_index :product_categories, [:product_category_name], :unique => true
  end
end
