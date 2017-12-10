class AddFieldsToSuppliers < ActiveRecord::Migration[5.1]
  def change
    add_column :suppliers, :supplier_currency,  :string
    add_column :suppliers, :supplier_web_url,   :string
    add_column :suppliers, :supplier_email,     :string
    add_column :suppliers, :supplier_phone,     :string
    add_column :suppliers, :supplier_address_1, :string
    add_column :suppliers, :supplier_address_2, :string
    add_column :suppliers, :supplier_city,      :string
    add_column :suppliers, :supplier_region,    :string
    add_column :suppliers, :supplier_postcode,  :string
    add_column :suppliers, :supplier_country_code,   :string
  end
end
