class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string  :supplier_name,     null: false
      t.string  :supplier_currency, null: false
      t.string  :supplier_web_url
      t.citext  :supplier_email
      t.string  :supplier_phone
      t.string  :supplier_contact_person
      t.string  :supplier_address_1
      t.string  :supplier_address_2
      t.string  :supplier_city
      t.string  :supplier_region
      t.string  :supplier_postcode
      t.string  :supplier_country_code
      t.string  :supplier_notes

      t.timestamps
    end
    add_index :suppliers, :supplier_name
    add_index :suppliers, [:supplier_name, :supplier_currency], unique: true
  end
end
