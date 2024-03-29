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

ActiveRecord::Schema.define(version: 20140105031905) do

  create_table "cars", force: true do |t|
    t.integer  "model_id"
    t.integer  "user_id"
    t.integer  "year"
    t.integer  "power"
    t.integer  "fuel_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "con_avg"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "car_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: true do |t|
    t.integer  "car_id"
    t.date     "date"
    t.integer  "odo"
    t.float    "quantity"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "con"
    t.float    "km"
  end

  create_table "fuel_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "makes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.integer  "make_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
