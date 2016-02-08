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

ActiveRecord::Schema.define(version: 20141102103617) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0
    t.integer  "attempts",   limit: 4,     default: 0
    t.text     "handler",    limit: 65535
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "feeds", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "url",          limit: 65535
    t.datetime "last_fetched"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",       limit: 4
    t.integer  "group_id",     limit: 4
  end

  add_index "feeds", ["url"], name: "index_feeds_on_url", unique: true, length: {"url"=>512}, using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "stories", force: :cascade do |t|
    t.text     "title",       limit: 65535
    t.text     "permalink",   limit: 65535
    t.text     "body",        limit: 65535
    t.integer  "feed_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published"
    t.boolean  "is_read"
    t.boolean  "keep_unread",               default: false
    t.boolean  "is_starred",                default: false
    t.text     "entry_id",    limit: 65535
  end

  add_index "stories", ["entry_id", "feed_id"], name: "index_stories_on_entry_id_and_feed_id", length: {"entry_id"=>512, "feed_id"=>nil}, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "setup_complete"
    t.string   "api_key",         limit: 255
  end

end
