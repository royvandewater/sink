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

ActiveRecord::Schema.define(version: 20130624164751) do

  create_table "accounts", force: true do |t|
    t.string   "username"
    t.string   "rdio_key"
    t.string   "rdio_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_tracks_to_sync"
    t.boolean  "auto_sync",                default: false
    t.datetime "last_synced_at"
    t.string   "sync_type"
    t.string   "session_token"
  end

  add_index "accounts", ["auto_sync"], name: "index_accounts_on_auto_sync"
  add_index "accounts", ["session_token"], name: "index_accounts_on_session_token"

end
