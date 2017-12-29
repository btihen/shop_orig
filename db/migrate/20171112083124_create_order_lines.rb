class CreateOrderLines < ActiveRecord::Migration[5.1]
  def change
    create_table :order_lines do |t|
      t.integer  :quantity
      t.text     :order_line_note
      t.monetize :order_line_actual_purchase_price

      t.timestamps
    end
  end
end
