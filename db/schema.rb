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

ActiveRecord::Schema.define(version: 20160331054819) do

  create_table "car_parks", force: :cascade do |t|
    t.string   "address",             limit: 255
    t.float    "price",               limit: 24
    t.string   "url_image",           limit: 255
    t.string   "description",         limit: 255
    t.boolean  "state"
    t.date     "started_at"
    t.date     "ended_at"
    t.time     "started_time"
    t.time     "ended_time"
    t.integer  "user_id",             limit: 4
    t.integer  "district_id",         limit: 4
    t.integer  "reservation_type_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "car_parks", ["district_id"], name: "index_car_parks_on_district_id", using: :btree
  add_index "car_parks", ["reservation_type_id"], name: "index_car_parks_on_reservation_type_id", using: :btree
  add_index "car_parks", ["user_id"], name: "index_car_parks_on_user_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "user_id",     limit: 4
    t.integer  "district_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "favorites", ["district_id"], name: "index_favorites_on_district_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "reservation_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "code",                limit: 255
    t.date     "started_at"
    t.date     "ended_at"
    t.time     "started_time"
    t.time     "ended_time"
    t.integer  "user_id",             limit: 4
    t.integer  "car_park_id",         limit: 4
    t.integer  "reservation_type_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "reservations", ["car_park_id"], name: "index_reservations_on_car_park_id", using: :btree
  add_index "reservations", ["reservation_type_id"], name: "index_reservations_on_reservation_type_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "car_parks", "districts"
  add_foreign_key "car_parks", "reservation_types"
  add_foreign_key "car_parks", "users"
  add_foreign_key "favorites", "districts"
  add_foreign_key "favorites", "users"
  add_foreign_key "reservations", "car_parks"
  add_foreign_key "reservations", "reservation_types"
  add_foreign_key "reservations", "users"
end
