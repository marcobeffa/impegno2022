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

ActiveRecord::Schema[7.0].define(version: 2022_08_23_110406) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notes", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.string "name"
    t.text "description"
    t.text "body"
    t.integer "note_type"
    t.decimal "euro_pagati", precision: 8, scale: 2
    t.decimal "euro_ricevuti", precision: 8, scale: 2
    t.datetime "data_start"
    t.datetime "data_end"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "long", precision: 10, scale: 6
    t.text "google_maps_url"
    t.integer "stato_attention"
    t.integer "visibility"
    t.boolean "pubblica"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_notes_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.text "avatar_url"
    t.string "name"
    t.string "surname"
    t.string "username"
    t.string "email"
    t.string "phone"
    t.string "smartphone"
    t.decimal "prezzo_orario"
    t.integer "active_profile_id"
    t.integer "team_id"
    t.integer "referente_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "notes", "profiles"
  add_foreign_key "profiles", "users"
end
