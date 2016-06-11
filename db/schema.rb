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

ActiveRecord::Schema.define(version: 20160522065241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.boolean  "private",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
  end

  create_table "bookmarks_tags", id: false, force: true do |t|
    t.integer "bookmark_id", null: false
    t.integer "tag_id",      null: false
  end

  add_index "bookmarks_tags", ["bookmark_id"], name: "index_bookmarks_tags_on_bookmark_id", using: :btree
  add_index "bookmarks_tags", ["tag_id"], name: "index_bookmarks_tags_on_tag_id", using: :btree

  create_table "browser_tabs", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.boolean  "private",           default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "browser_window_id"
  end

  add_index "browser_tabs", ["browser_window_id"], name: "index_browser_tabs_on_browser_window_id", using: :btree

  create_table "browser_windows", force: true do |t|
    t.boolean  "private",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "device_id"
  end

  add_index "browser_windows", ["device_id"], name: "index_browser_windows_on_device_id", using: :btree

  create_table "devices", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

end
