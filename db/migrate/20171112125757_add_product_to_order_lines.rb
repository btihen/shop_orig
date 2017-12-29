class AddProductToOrderLines < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_lines, :product, foreign_key: true, index: true
  end
end
