# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130811034255) do

  create_table "buys", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.float    "price"
    t.float    "total"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "buys", ["product_id"], :name => "index_buys_on_product_id"
  add_index "buys", ["supplier_id"], :name => "index_buys_on_supplier_id"

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "nit"
    t.string   "city"
    t.string   "address"
    t.integer  "phone"
    t.integer  "cellphone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
  end

  add_index "customers", ["nit"], :name => "index_customers_on_nit", :unique => true

  create_table "product_brands", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "description"
    t.integer  "total"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "product_brand_id"
    t.string   "code"
  end

  add_index "products", ["code"], :name => "index_products_on_code", :unique => true

  create_table "sells", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.float    "price"
    t.float    "total"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sells", ["customer_id"], :name => "index_sells_on_customer_id"
  add_index "sells", ["product_id"], :name => "index_sells_on_product_id"

  create_table "suppliers", :force => true do |t|
    t.string   "email"
    t.string   "city"
    t.string   "address"
    t.integer  "phone"
    t.integer  "cellphone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

end
