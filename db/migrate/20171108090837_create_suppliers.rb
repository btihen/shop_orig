class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :supplier_name
      t.text :supplier_notes

      t.timestamps
    end
  end
end
