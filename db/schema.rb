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

ActiveRecord::Schema.define(version: 20161008075555) do

  create_table "bookmarks", force: :cascade do |t|
    t.text     "url",        limit: 65535
    t.text     "title",      limit: 65535
    t.boolean  "private",    limit: 1,     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment",    limit: 65535
    t.integer  "user_id",    limit: 4
  end

  add_index "bookmarks", ["title"], name: "index_bookmarks_on_title", length: {"title"=>256}, using: :btree
  add_index "bookmarks", ["url"], name: "index_bookmarks_on_url", length: {"url"=>256}, using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "bookmarks_tags", id: false, force: :cascade do |t|
    t.integer  "bookmark_id", limit: 4, null: false
    t.integer  "tag_id",      limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookmarks_tags", ["bookmark_id"], name: "index_bookmarks_tags_on_bookmark_id", using: :btree
  add_index "bookmarks_tags", ["tag_id"], name: "index_bookmarks_tags_on_tag_id", using: :btree

  create_table "browser_tabs", force: :cascade do |t|
    t.string   "url",               limit: 255
    t.string   "title",             limit: 255
    t.boolean  "private",           limit: 1,   default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "browser_window_id", limit: 4
  end

  add_index "browser_tabs", ["browser_window_id"], name: "index_browser_tabs_on_browser_window_id", using: :btree

  create_table "browser_windows", force: :cascade do |t|
    t.boolean  "private",    limit: 1, default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "device_id",  limit: 4
  end

  add_index "browser_windows", ["device_id"], name: "index_browser_windows_on_device_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
    t.integer  "user_id",    limit: 4
  end

  add_index "devices", ["user_id"], name: "index_devices_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 255
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree
  add_index "tags", ["slug"], name: "index_tags_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",              limit: 255, null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "full_name",          limit: 255
    t.string   "username",           limit: 255
    t.string   "slug",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
