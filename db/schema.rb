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

ActiveRecord::Schema.define(version: 2020_04_15_214856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_api_keys_on_name", unique: true
  end

  create_table "approvals", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "user_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_approvals_on_author_id"
    t.index ["role_id", "user_id"], name: "index_approvals_on_role_id_and_user_id", unique: true
    t.index ["role_id"], name: "index_approvals_on_role_id"
    t.index ["user_id", "role_id"], name: "index_approvals_on_user_id_and_role_id", unique: true
    t.index ["user_id"], name: "index_approvals_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "note", default: ""
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_groups_on_author_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "user_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_members_on_author_id"
    t.index ["group_id", "user_id"], name: "index_members_on_group_id_and_user_id", unique: true
    t.index ["group_id"], name: "index_members_on_group_id"
    t.index ["user_id", "group_id"], name: "index_members_on_user_id_and_group_id", unique: true
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "activities", default: [], array: true
    t.text "note", default: ""
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_roles_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "wso2is_userid"
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.boolean "csu_confirmed"
    t.date "csu_confirmed_at"
    t.string "csu_confirmed_by"
    t.string "session_index"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.text "note", default: ""
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_users_on_author_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.bigint "author_id"
    t.string "action"
    t.text "parameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_works_on_author_id"
    t.index ["trackable_type", "trackable_id"], name: "index_works_on_trackable_type_and_trackable_id"
  end

  add_foreign_key "approvals", "roles"
  add_foreign_key "approvals", "users"
  add_foreign_key "members", "groups"
  add_foreign_key "members", "users"
end
