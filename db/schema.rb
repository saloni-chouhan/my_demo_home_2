# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_27_050335) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "airlines", force: :cascade do |t|
    t.string "name"
    t.string "airline_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "airport_id"
    t.index ["airport_id"], name: "index_airlines_on_airport_id"
  end

  create_table "airports", force: :cascade do |t|
    t.string "airport_name"
    t.string "country"
    t.string "state"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.string "name_of_passenger"
    t.string "price"
    t.string "source"
    t.string "destination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ticket_id"
    t.string "passport_no"
    t.string "address"
    t.string "class_type"
    t.string "age"
    t.string "phone"
    t.string "email"
    t.integer "user_id"
    t.index ["ticket_id"], name: "index_bookings_on_ticket_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "name"
    t.string "source"
    t.string "destination"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "airline_id"
    t.index ["airline_id"], name: "index_flights_on_airline_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "d_time"
    t.datetime "a_time"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "flight_id"
    t.index ["flight_id"], name: "index_schedules_on_flight_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "seatno"
    t.string "class_type"
    t.string "source"
    t.string "destination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "flight_id"
    t.index ["flight_id"], name: "index_tickets_on_flight_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "airport_id"
    t.string "name"
    t.string "age"
    t.string "phone"
    t.integer "role_id"
    t.index ["airport_id"], name: "index_users_on_airport_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
