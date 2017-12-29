# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171224120222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "order_lines", force: :cascade do |t|
    t.integer "quantity"
    t.text "order_line_note"
    t.integer "order_line_actual_purchase_price_cents", default: 0, null: false
    t.string "order_line_actual_purchase_price_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.bigint "product_id"
    t.index ["order_id"], name: "index_order_lines_on_order_id"
    t.index ["product_id"], name: "index_order_lines_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.text "reason"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "product_category_name"
    t.bigint "tax_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_name"], name: "index_product_categories_on_product_category_name", unique: true
    t.index ["tax_category_id"], name: "index_product_categories_on_tax_category_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.text "product_description"
    t.jsonb "product_details", default: "{}", null: false
    t.integer "product_purchase_price_cents", default: 0, null: false
    t.string "product_purchase_price_currency", default: "USD", null: false
    t.integer "product_resell_item_price_cents", default: 0, null: false
    t.string "product_resell_item_price_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supplier_id"
    t.bigint "product_category_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["product_details"], name: "index_products_on_product_details", using: :gin
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "registers", force: :cascade do |t|
    t.string "register_currency"
    t.integer "start_amount_cents", default: 0, null: false
    t.string "start_amount_currency", default: "USD", null: false
    t.integer "close_amount_cents"
    t.string "close_amount_currency", default: "USD", null: false
    t.integer "cash_deposit_cents"
    t.string "cash_deposit_currency", default: "USD", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_registers_on_user_id"
  end

  create_table "sale_lines", force: :cascade do |t|
    t.text "sale_line_note"
    t.integer "sale_price_cents", default: 0, null: false
    t.string "sale_price_currency", default: "USD", null: false
    t.bigint "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "stock_item_id"
    t.index ["sale_id"], name: "index_sale_lines_on_sale_id"
    t.index ["stock_item_id"], name: "index_sale_lines_on_stock_item_id"
  end

  create_table "sales", force: :cascade do |t|
    t.string "payment_method"
    t.bigint "register_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["register_id"], name: "index_sales_on_register_id"
  end

  create_table "stock_items", force: :cascade do |t|
    t.string "status"
    t.datetime "add_datetime"
    t.datetime "sold_datetime"
    t.integer "sell_price_cents", default: 0, null: false
    t.string "sell_price_currency", default: "USD", null: false
    t.bigint "order_line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_line_id"], name: "index_stock_items_on_order_line_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "supplier_name"
    t.string "supplier_currency"
    t.string "supplier_web_url"
    t.citext "supplier_email"
    t.string "supplier_phone"
    t.string "supplier_contact_person"
    t.string "supplier_address_1"
    t.string "supplier_address_2"
    t.string "supplier_city"
    t.string "supplier_region"
    t.string "supplier_postcode"
    t.string "supplier_country_code"
    t.string "supplier_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_currency"], name: "index_suppliers_on_supplier_currency"
    t.index ["supplier_name"], name: "index_suppliers_on_supplier_name", unique: true
  end

  create_table "tax_categories", force: :cascade do |t|
    t.string "tax_category_name"
    t.decimal "tax_category_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tax_category_name"], name: "index_tax_categories_on_tax_category_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.citext "username"
    t.string "full_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role"], name: "index_users_on_role"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "order_lines", "orders"
  add_foreign_key "order_lines", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "product_categories", "tax_categories"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "suppliers"
  add_foreign_key "registers", "users"
  add_foreign_key "sale_lines", "sales"
  add_foreign_key "sale_lines", "stock_items"
  add_foreign_key "sales", "registers"
  add_foreign_key "stock_items", "order_lines"
end
