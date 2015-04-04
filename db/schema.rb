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

ActiveRecord::Schema.define(version: 20150404164925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brief_types", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "briefs", force: true do |t|
    t.text     "name"
    t.integer  "brief_type_id"
    t.text     "description"
    t.text     "objectives"
    t.text     "values"
    t.text     "aesthetic"
    t.text     "location"
    t.text     "practicalities"
    t.integer  "budget_low"
    t.integer  "budget_high"
    t.text     "brand_name"
    t.text     "budget_description"
    t.text     "company_name"
    t.text     "email"
    t.text     "telephone"
    t.text     "twitter_handle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "slug"
    t.text     "why_commissioning"
    t.text     "success_criteria"
    t.date     "pitch_deadline"
    t.date     "delivery_deadline"
  end

  create_table "users", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
