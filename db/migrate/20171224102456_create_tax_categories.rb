class CreateTaxCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :tax_categories do |t|
      t.string :tax_category_name
      t.decimal :tax_category_rate

      t.timestamps
    end
    add_index :tax_categories, [:tax_category_name], :unique => true
  end
end
