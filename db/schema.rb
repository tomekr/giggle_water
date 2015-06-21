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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150621225124) do

  create_table "bar_items", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "bar_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "bar_items", ["bar_id"], name: "index_bar_items_on_bar_id"
  add_index "bar_items", ["ingredient_id"], name: "index_bar_items_on_ingredient_id"

  create_table "bars", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "bars", ["user_id"], name: "index_bars_on_user_id"

  create_table "drink_items", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "drink_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "amount"
    t.string   "ingredient_use"
  end

  add_index "drink_items", ["drink_id"], name: "index_drink_items_on_drink_id"
  add_index "drink_items", ["ingredient_id"], name: "index_drink_items_on_ingredient_id"

  create_table "drinks", force: :cascade do |t|
    t.string   "name"
    t.string   "glass"
    t.text     "directions"
    t.string   "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "amount"
    t.string   "use"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "name"
    t.string   "ingredient_type"
    t.integer  "drink_items_count", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
