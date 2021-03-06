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

ActiveRecord::Schema.define(version: 2020_12_02_144030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "bookings", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.integer "adjusted_price"
    t.bigint "experience_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "confirmation", default: "Pending"
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["experience_id"], name: "index_bookings_on_experience_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "experience_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "experience_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_experience_categories_on_category_id"
    t.index ["experience_id"], name: "index_experience_categories_on_experience_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.bigint "host_id", null: false
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.boolean "kid_friendly", default: false
    t.string "address"
    t.integer "max_guests"
    t.string "language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "duration"
    t.string "tagline"
    t.string "spotify_url"
    t.index ["host_id"], name: "index_experiences_on_host_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "experience_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_favorites_on_customer_id"
    t.index ["experience_id"], name: "index_favorites_on_experience_id"
  end

  create_table "guest_bookings", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_guest_bookings_on_booking_id"
    t.index ["user_id"], name: "index_guest_bookings_on_user_id"
  end

  create_table "instances", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "experience_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.index ["experience_id"], name: "index_instances_on_experience_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "amount"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "experience_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "phone_number"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "experiences"
  add_foreign_key "bookings", "users", column: "customer_id"
  add_foreign_key "experience_categories", "categories"
  add_foreign_key "experience_categories", "experiences"
  add_foreign_key "experiences", "users", column: "host_id"
  add_foreign_key "favorites", "experiences"
  add_foreign_key "favorites", "users", column: "customer_id"
  add_foreign_key "guest_bookings", "bookings"
  add_foreign_key "guest_bookings", "users"
  add_foreign_key "instances", "experiences"
  add_foreign_key "items", "experiences"
  add_foreign_key "reviews", "bookings"
end
