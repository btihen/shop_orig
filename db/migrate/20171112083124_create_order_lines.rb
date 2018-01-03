class CreateOrderLines < ActiveRecord::Migration[5.1]
  def change
    create_table :order_lines do |t|
      t.integer  :order_line_quantity,                        null: false
      t.text     :order_line_note
      t.monetize :order_line_actual_purchase_price,           null: false

      t.timestamps
    end
    add_reference :order_lines, :product, foreign_key: true, index: true
    add_reference :order_lines, :order,   foreign_key: true, index: true
  end
end
