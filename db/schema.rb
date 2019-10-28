# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_28_192330) do

  create_table "employees", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.integer "balance", default: 0
    t.date "start_date", null: false
    t.string "location", null: false
    t.integer "department", null: false
    t.string "region", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_cards", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "pay_period", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_time_cards_on_employee_id"
  end

  create_table "time_clock_events", force: :cascade do |t|
    t.integer "time_card_id"
    t.datetime "time", null: false
    t.string "type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["time_card_id"], name: "index_time_clock_events_on_time_card_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "employee_id"
    t.string "created_by", null: false
    t.date "date", null: false
    t.integer "transaction_type", null: false
    t.string "description"
    t.integer "coin_balance"
    t.integer "delta", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_transactions_on_employee_id"
  end

  add_foreign_key "time_cards", "employees"
  add_foreign_key "time_clock_events", "time_cards"
  add_foreign_key "transactions", "employees"
end
