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

ActiveRecord::Schema.define(version: 2020_10_12_223905) do

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

  create_table "addresses", force: :cascade do |t|
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "zip_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "albums", force: :cascade do |t|
    t.integer "wedding_id"
    t.string "title"
    t.boolean "is_bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "wedding_id", null: false
    t.index ["wedding_id"], name: "index_guests_on_wedding_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.integer "wedding_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "style_background_color"
    t.string "style_color"
    t.string "style_align"
    t.string "line0_text"
    t.string "line0_font"
    t.string "line0_size"
    t.string "line0_color"
    t.string "line0_align"
    t.string "line1_text"
    t.string "line1_font"
    t.string "line1_size"
    t.string "line1_color"
    t.string "line1_align"
    t.string "line2_text"
    t.string "line2_font"
    t.string "line2_size"
    t.string "line2_align"
    t.string "line3_text"
    t.string "line3_font"
    t.string "line3_size"
    t.string "line3_color"
    t.string "line3_align"
    t.string "line4_text"
    t.string "line4_font"
    t.string "line4_size"
    t.string "line4_color"
    t.string "line4_align"
    t.string "line5_text"
    t.string "line5_font"
    t.string "line5_size"
    t.string "line5_color"
    t.string "line5_align"
    t.string "line6_text"
    t.string "line6_font"
    t.string "line6_size"
    t.string "line6_align"
    t.string "line7_text"
    t.string "line7_font"
    t.string "line7_size"
    t.string "line7_color"
    t.string "line7_align"
    t.string "line8_text"
    t.string "line8_font"
    t.string "line8_size"
    t.string "line8_color"
    t.string "line8_align"
    t.string "line9_text"
    t.string "line9_font"
    t.string "line9_size"
    t.string "line9_color"
    t.string "line9_align"
    t.string "line10_text"
    t.string "line10_font"
    t.string "line10_size"
    t.string "line10_color"
    t.string "line10_align"
    t.string "line11_text"
    t.string "line11_font"
    t.string "line11_size"
    t.string "line11_color"
    t.string "line11_align"
    t.string "line12_text"
    t.string "line12_font"
    t.string "line12_size"
    t.string "line12_color"
    t.string "line12_align"
    t.string "line13_text"
    t.string "line13_font"
    t.string "line13_size"
    t.string "line13_color"
    t.string "line13_align"
    t.string "line14_text"
    t.string "line14_font"
    t.string "line14_size"
    t.string "line14_color"
    t.string "line14_align"
    t.string "line2_color"
    t.string "line6_color"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "album_id"
    t.string "caption"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "to_dos", force: :cascade do |t|
    t.integer "wedding_id"
    t.string "todo_name"
    t.boolean "isCompleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_photos", force: :cascade do |t|
    t.integer "photo_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_weddings", force: :cascade do |t|
    t.integer "wedding_id"
    t.integer "user_id"
    t.boolean "is_admin"
    t.integer "accommodation_id"
    t.integer "attending_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "email"
    t.string "gender"
    t.integer "address_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "venues", force: :cascade do |t|
    t.integer "venue_type"
    t.string "venue_name"
    t.string "street_address"
    t.string "city"
    t.string "country"
    t.integer "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wedding_themes", force: :cascade do |t|
    t.string "main_color"
    t.string "dark_shadow"
    t.string "dark_accent"
    t.string "highlight"
    t.string "light_accent"
    t.string "font_family"
    t.string "theme_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wedding_venues", force: :cascade do |t|
    t.integer "wedding_id"
    t.integer "venue_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weddings", force: :cascade do |t|
    t.string "registry_link"
    t.string "slug"
    t.integer "wedding_theme_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "wedding_date"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "guests", "weddings"
end
