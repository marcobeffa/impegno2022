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

ActiveRecord::Schema[7.0].define(version: 2022_12_14_100151) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendars", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.string "name"
    t.text "description"
    t.text "body"
    t.text "image_square_url"
    t.text "image_logo_url"
    t.integer "calendar_type"
    t.integer "luogo_note_id"
    t.integer "attivita_note_id"
    t.integer "gruppo_note_id"
    t.integer "responsabile_profile_id"
    t.boolean "public"
    t.integer "visibility"
    t.decimal "uscite", precision: 8, scale: 2
    t.decimal "entrate", precision: 8, scale: 2
    t.datetime "data_start"
    t.datetime "data_end"
    t.decimal "zoom_index", precision: 8, scale: 2
    t.string "hex_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_calendars_on_profile_id"
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.string "name"
    t.string "description"
    t.text "image_icona_url"
    t.text "image_card_url"
    t.bigint "calendar_id", null: false
    t.text "indirizzo"
    t.text "luogo"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_categories_on_calendar_id"
    t.index ["profile_id"], name: "index_categories_on_profile_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "referencte_c_id"
    t.bigint "profile_id"
    t.integer "contatto_p_id"
    t.string "nome"
    t.string "cognome"
    t.string "indirizzo"
    t.string "codice_fiscale"
    t.string "email"
    t.string "telefono"
    t.string "via"
    t.string "cap"
    t.string "paese_città"
    t.string "provincia"
    t.text "address_complete"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_contacts_on_profile_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.string "name"
    t.string "description"
    t.text "image_icona_url"
    t.text "image_card_url"
    t.integer "n_partecipanti"
    t.integer "n_conduttori"
    t.integer "durata_minuti"
    t.text "indirizzo"
    t.text "luogo"
    t.string "paese"
    t.decimal "prezzo_pieno"
    t.decimal "prezzo_bambini"
    t.bigint "calendar_id"
    t.bigint "category_id"
    t.datetime "data_conferma"
    t.boolean "public"
    t.integer "visibility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_events_on_calendar_id"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["profile_id"], name: "index_events_on_profile_id"
  end

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

  create_table "noteslots", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "slot_id", null: false
    t.bigint "note_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "note_type"
    t.index ["note_id"], name: "index_noteslots_on_note_id"
    t.index ["profile_id"], name: "index_noteslots_on_profile_id"
    t.index ["slot_id"], name: "index_noteslots_on_slot_id"
  end

  create_table "prenotations", force: :cascade do |t|
    t.bigint "contact_id"
    t.bigint "slot_id"
    t.bigint "event_id", null: false
    t.bigint "user_id"
    t.string "email"
    t.string "telefono"
    t.integer "stato_prenotazione"
    t.datetime "confermata"
    t.bigint "profile_id"
    t.integer "pagamento_tipo"
    t.datetime "data_pagamento"
    t.integer "fattura_n"
    t.integer "fattura_anno"
    t.decimal "price_value"
    t.string "name"
    t.string "description"
    t.integer "tipo_prenotazione"
    t.boolean "public"
    t.integer "visibility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_prenotations_on_contact_id"
    t.index ["event_id"], name: "index_prenotations_on_event_id"
    t.index ["profile_id"], name: "index_prenotations_on_profile_id"
    t.index ["slot_id"], name: "index_prenotations_on_slot_id"
    t.index ["user_id"], name: "index_prenotations_on_user_id"
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

  create_table "slots", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "calendar_id", null: false
    t.boolean "public"
    t.integer "visibility"
    t.datetime "data_start"
    t.datetime "data_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "calendario_contact_note_id"
    t.integer "calendario_profile_id"
    t.integer "sublocation_id"
    t.integer "luogo_n_id"
    t.integer "event_id"
    t.integer "responsabile_p_id"
    t.integer "category_id"
    t.index ["calendar_id"], name: "index_slots_on_calendar_id"
    t.index ["profile_id"], name: "index_slots_on_profile_id"
  end

  create_table "sublocations", force: :cascade do |t|
    t.bigint "note_id", null: false
    t.string "name"
    t.string "description"
    t.text "img_quadrata_url"
    t.text "img_ret_orizzontale"
    t.text "img_ret_verticale"
    t.integer "num_posti_max"
    t.integer "num_location"
    t.boolean "public"
    t.integer "visibility"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_sublocations_on_note_id"
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

  add_foreign_key "calendars", "profiles"
  add_foreign_key "categories", "calendars"
  add_foreign_key "categories", "profiles"
  add_foreign_key "contacts", "profiles"
  add_foreign_key "contacts", "users"
  add_foreign_key "events", "calendars"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "profiles"
  add_foreign_key "notes", "profiles"
  add_foreign_key "noteslots", "notes"
  add_foreign_key "noteslots", "profiles"
  add_foreign_key "noteslots", "slots"
  add_foreign_key "prenotations", "contacts"
  add_foreign_key "prenotations", "events"
  add_foreign_key "prenotations", "profiles"
  add_foreign_key "prenotations", "slots"
  add_foreign_key "prenotations", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "slots", "calendars"
  add_foreign_key "slots", "profiles"
  add_foreign_key "sublocations", "notes"
end
