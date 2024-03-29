class CreateTaxCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :tax_categories do |t|
      t.string   :tax_category_name, null: false
      # t.jsonb    :tax_category_name, null: false, default: '{}'
      # t.decimal  :tax_rate,          null: false
      # t.date     :tax_start_date,    null: false
      # t.date     :tax_end_date

      t.timestamps
    end
    add_index :tax_categories, :tax_category_name, unique: true
    # add_index :tax_categories, :tax_category_name,  using: :gin
    # add_index :tax_categories, [:tax_category_name, :tax_category_name, :tax_start_date],
    #                                unique: true,
    #                                  name: 'tax_unique_index'
  end
end
