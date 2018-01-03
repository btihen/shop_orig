class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string   :product_code,               null: false
      t.string   :product_name,               null: false
      t.string   :product_size
      t.string   :product_color
      t.string   :product_material
      t.string   :product_status
      t.jsonb    :product_details,            null: false, default: '{}'
      t.text     :product_added_info
      t.date     :product_sell_by_date
      t.monetize :product_supplier_price,     null: false
      t.monetize :product_resell_item_price,  null: false

      t.timestamps
    end
    add_reference :products, :supplier, foreign_key: true, index: true
    add_reference :products, :product_category, foreign_key: true

    add_index :products, :product_name
    add_index :products, :product_code,      unique: true
    # https://stackoverflow.com/questions/5443740/how-do-i-handle-too-long-index-names-in-a-ruby-on-rails-migration-with-mysql
    add_index :products, [:product_name, :product_size, :product_color],
                                             unique: true,
                                               name: 'product_unique_index'
    # https://nandovieira.com/using-postgresql-and-jsonb-with-ruby-on-rails
    add_index :products, :product_details,    using: :gin
  end
end
