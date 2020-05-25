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

ActiveRecord::Schema.define(version: 2020_05_23_124044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.date "birth"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "movements", force: :cascade do |t|
    t.bigint "subscription_id"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_movements_on_subscription_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "package_id"
    t.integer "child_size", default: 1
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["package_id"], name: "index_options_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.integer "p_type", default: 0
    t.integer "period", default: 0
    t.integer "len", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.date "birth"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parents_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "child_id"
    t.datetime "checkin_time"
    t.datetime "checkout_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_sessions_on_child_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "child_id"
    t.bigint "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_time"
    t.index ["child_id"], name: "index_subscriptions_on_child_id"
    t.index ["option_id"], name: "index_subscriptions_on_option_id"
  end

  create_table "survey_results", force: :cascade do |t|
    t.string "answers"
    t.integer "options"
    t.bigint "survey_id"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_survey_results_on_parent_id"
    t.index ["survey_id"], name: "index_survey_results_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "question"
    t.integer "sequence", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "children", "parents"
  add_foreign_key "movements", "subscriptions"
  add_foreign_key "options", "packages"
  add_foreign_key "parents", "users"
  add_foreign_key "sessions", "children"
  add_foreign_key "subscriptions", "children"
  add_foreign_key "subscriptions", "options"
  add_foreign_key "survey_results", "parents"
  add_foreign_key "survey_results", "surveys"
end
