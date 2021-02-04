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

ActiveRecord::Schema.define(version: 2021_02_04_001548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dealerships", force: :cascade do |t|
    t.string "name"
    t.integer "max_inventory"
    t.boolean "in_county"
    t.string "created_at"
    t.string "updated_at"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.integer "square_footage"
    t.boolean "parking_lot"
    t.string "created_at"
    t.string "updated_at"
  end

  create_table "snowboards", force: :cascade do |t|
    t.string "name"
    t.integer "length"
    t.boolean "wide_stance"
    t.string "created_at"
    t.string "updated_at"
  end

end
