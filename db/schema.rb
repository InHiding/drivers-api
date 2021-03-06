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

ActiveRecord::Schema.define(version: 20160201184443) do

  create_table "driver_positions", force: :cascade do |t|
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.boolean  "driver_available", default: false
    t.integer  "driver_id",                        null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "driver_positions", ["driver_id"], name: "index_driver_positions_on_driver_id", unique: true

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.string   "car_plate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
