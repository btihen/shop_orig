class CreateTaxRates < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_rates do |t|
      t.decimal  :tax_rate
      t.date     :tax_start_date
      t.string   :tax_end_date
      t.references :tax_category, foreign_key: true

      t.timestamps
    end

    add_index :tax_rates, :tax_rate
    add_index :tax_rates, :tax_start_date
    add_index :tax_rates, :tax_end_date
  end
end
