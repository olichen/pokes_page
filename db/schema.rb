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

ActiveRecord::Schema.define(version: 20170224025532) do

  create_table "abilities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_pokes", force: :cascade do |t|
    t.integer  "poke_id"
    t.integer  "count"
    t.float    "usage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poke_id"], name: "index_data_pokes_on_poke_id"
  end

  create_table "data_smogons", force: :cascade do |t|
    t.float    "cutoff"
    t.float    "cutoff_deviation"
    t.string   "metagame"
    t.integer  "num_battles"
    t.date     "month"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "data_viabilities", force: :cascade do |t|
    t.integer  "numplayers"
    t.integer  "gxe_top"
    t.integer  "gxe_99"
    t.integer  "gxe_95"
    t.integer  "data_poke_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["data_poke_id"], name: "index_data_viabilities_on_data_poke_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "natures", force: :cascade do |t|
    t.string   "name"
    t.integer  "increased_stat_id"
    t.integer  "decreased_stat_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "pokes", force: :cascade do |t|
    t.string   "name"
    t.integer  "weight"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
