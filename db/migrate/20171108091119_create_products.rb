class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string   :product_name
      t.text     :product_description
      t.jsonb    :product_details, null: false, default: '{}'
      t.monetize :product_supplier_price
      t.monetize :product_resell_item_price

      t.timestamps
    end
    # https://nandovieira.com/using-postgresql-and-jsonb-with-ruby-on-rails
    add_index    :products, :product_details, using: :gin
  end
end
