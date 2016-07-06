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

ActiveRecord::Schema.define(version: 20160706062630) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.text     "url"
    t.text     "title"
    t.boolean  "private",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "comment"
    t.integer  "user_id"
  end

  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "bookmarks_tags", id: false, force: :cascade do |t|
    t.integer  "bookmark_id", null: false
    t.integer  "tag_id",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bookmarks_tags", ["bookmark_id"], name: "index_bookmarks_tags_on_bookmark_id", using: :btree
  add_index "bookmarks_tags", ["tag_id"], name: "index_bookmarks_tags_on_tag_id", using: :btree

  create_table "browser_tabs", force: :cascade do |t|
    t.string   "url",               limit: 255
    t.string   "title",             limit: 255
    t.boolean  "private",                       default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "browser_window_id"
  end

  add_index "browser_tabs", ["browser_window_id"], name: "index_browser_tabs_on_browser_window_id", using: :btree

  create_table "browser_windows", force: :cascade do |t|
    t.boolean  "private",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "device_id"
  end

  add_index "browser_windows", ["device_id"], name: "index_browser_windows_on_device_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
    t.integer  "user_id"
  end

  add_index "devices", ["user_id"], name: "index_devices_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
