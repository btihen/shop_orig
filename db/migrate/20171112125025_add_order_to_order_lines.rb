class AddOrderToOrderLines < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_lines, :order, foreign_key: true, index: true
  end
end
