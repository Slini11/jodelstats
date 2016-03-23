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

ActiveRecord::Schema.define(version: 20160323120117) do

  create_table "api_keys", force: :cascade do |t|
    t.string   "token"
    t.datetime "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jodel_cities", force: :cascade do |t|
    t.string   "name"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "highest_votes"
  end

  add_index "jodel_cities", ["name"], name: "index_jodel_cities_on_name", unique: true

  create_table "jodel_posts", force: :cascade do |t|
    t.string   "post_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "message"
    t.integer  "vote_count"
    t.string   "color"
    t.string   "image_url"
    t.string   "thumbnail_url"
    t.integer  "jodel_city_id"
  end

  add_index "jodel_posts", ["jodel_city_id", "vote_count"], name: "index_jodel_posts_on_jodel_city_id_and_vote_count"
  add_index "jodel_posts", ["jodel_city_id"], name: "index_jodel_posts_on_jodel_city_id"
  add_index "jodel_posts", ["post_id"], name: "index_jodel_posts_on_post_id", unique: true

end
