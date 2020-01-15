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

ActiveRecord::Schema.define(version: 2020_01_04_070410) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address", limit: 40, null: false
    t.bigint "potal_code", null: false
    t.string "prefectures", limit: 40, null: false
    t.string "municipalties", limit: 40, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "credit_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "card_number", null: false
    t.date "expiration_date_month", null: false
    t.date "expiration_date_year", null: false
    t.bigint "security_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", limit: 40, default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", limit: 40, default: "", null: false
    t.string "name_full", limit: 40, default: "", null: false
    t.string "name_cana", limit: 40, default: "", null: false
    t.bigint "birth_year", default: 0, null: false
    t.integer "birth_month", limit: 1, default: 0, null: false
    t.integer "birth_day", limit: 1, default: 0, null: false
    t.string "call_number", limit: 40, default: "", null: false
    t.bigint "point", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
