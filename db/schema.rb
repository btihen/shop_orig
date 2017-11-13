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

ActiveRecord::Schema.define(version: 20171113124110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.text "note"
    t.integer "item_purchase_price_cents", default: 0, null: false
    t.string "item_purchase_price_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.bigint "product_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.text "reason"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.text "description"
    t.integer "product_price_cents", default: 0, null: false
    t.string "product_price_currency", default: "USD", null: false
    t.string "product_currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supplier_id"
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "registers", force: :cascade do |t|
    t.integer "start_amount_cents", default: 0, null: false
    t.string "start_amount_currency", default: "USD", null: false
    t.integer "close_amount_cents", default: 0, null: false
    t.string "close_amount_currency", default: "USD", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_registers_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "sale_amount_cents", default: 0, null: false
    t.string "sale_amount_currency", default: "USD", null: false
    t.integer "amount_given_cents", default: 0, null: false
    t.string "amount_given_currency", default: "USD", null: false
    t.integer "return_amount_cents", default: 0, null: false
    t.string "return_amount_currency", default: "USD", null: false
    t.string "payment_method"
    t.bigint "register_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["register_id"], name: "index_sales_on_register_id"
  end

  create_table "stock_items", force: :cascade do |t|
    t.string "status"
    t.datetime "add_datetime"
    t.datetime "sale_datetime"
    t.integer "sale_price_cents", default: 0, null: false
    t.string "sale_price_currency", default: "USD", null: false
    t.bigint "order_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_item_id"], name: "index_stock_items_on_order_item_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "supplier_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "full_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "suppliers"
  add_foreign_key "registers", "users"
  add_foreign_key "sales", "registers"
  add_foreign_key "stock_items", "order_items"
end
