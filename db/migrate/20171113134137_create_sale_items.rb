class CreateSaleItems < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_items do |t|
      t.text :note
      t.monetize :sale_price
      t.references :sale, foreign_key: true, index: true

      t.timestamps
    end
  end
end
