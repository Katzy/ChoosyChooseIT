# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150501192948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chooseit_choices", force: :cascade do |t|
    t.string  "description"
    t.integer "chooseit_id"
  end

  add_index "chooseit_choices", ["chooseit_id"], name: "index_chooseit_choices_on_chooseit_id", using: :btree

  create_table "chooseit_response_choices", force: :cascade do |t|
    t.integer "chooseit_choice_id"
    t.integer "chooseit_response_id"
  end

  add_index "chooseit_response_choices", ["chooseit_choice_id", "chooseit_response_id"], name: "chooseit_response_choices_index", unique: true, using: :btree
  add_index "chooseit_response_choices", ["chooseit_response_id"], name: "index_chooseit_response_choices_on_chooseit_response_id", using: :btree

  create_table "chooseit_responses", force: :cascade do |t|
    t.integer  "respondent_id"
    t.integer  "chooseit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chooseit_responses", ["chooseit_id", "respondent_id"], name: "index_chooseit_responses_on_chooseit_id_and_respondent_id", unique: true, using: :btree
  add_index "chooseit_responses", ["respondent_id"], name: "index_chooseit_responses_on_respondent_id", using: :btree

  create_table "chooseits", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
    t.string   "genres",     default: "", null: false
  end

  add_index "chooseits", ["author_id"], name: "index_chooseits_on_author_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.integer  "guest_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "chooseit_choices", "chooseits"
  add_foreign_key "chooseit_response_choices", "chooseit_choices"
  add_foreign_key "chooseit_response_choices", "chooseit_responses"
  add_foreign_key "chooseit_responses", "chooseits"
  add_foreign_key "chooseit_responses", "users", column: "respondent_id"
  add_foreign_key "chooseits", "users", column: "author_id"
end
