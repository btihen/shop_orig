class CreateSaleLines < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_lines do |t|
      t.text     :sale_line_note
      t.monetize :sale_price
      t.references :sale, foreign_key: true, index: true

      t.timestamps
    end
  end
end
