class CreateSaleLines < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_lines do |t|
      t.integer  :sale_line_quantity,              null: false
      t.monetize :sale_line_sale_price,            null: false
      t.text     :sale_line_note
      t.references :sale,                   foreign_key: true, index: true

      t.timestamps
    end
    add_reference :sale_lines, :stock_item, foreign_key: true, index: true
  end
end
