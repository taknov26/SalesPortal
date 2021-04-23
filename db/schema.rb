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

ActiveRecord::Schema.define(version: 2021_04_21_025733) do

  create_table "client_comments", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "client_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer "client_company_id"
    t.string "branch_name"
    t.string "address"
    t.string "telephone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "costs", force: :cascade do |t|
    t.integer "matter_id"
    t.string "item"
    t.integer "item_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crient_people", force: :cascade do |t|
    t.integer "client_id"
    t.string "name"
    t.string "department"
    t.string "telephone_number"
    t.string "email"
    t.string "status", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "name_kana"
    t.string "telephone_number"
    t.string "belonging"
    t.string "position"
    t.string "phone_extension"
    t.string "icon_id"
    t.boolean "is_active", default: true
    t.string "role", default: "1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "matter_comments", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "matter_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matters", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "client_company_id"
    t.integer "client_id"
    t.integer "client_person_id"
    t.string "name"
    t.integer "price"
    t.integer "status", default: 0
    t.string "file_id"
    t.date "fixed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
