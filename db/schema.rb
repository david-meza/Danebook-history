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

ActiveRecord::Schema.define(version: 20150811001239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "author_id",        null: false
    t.string   "body",             null: false
    t.integer  "commentable_id",   null: false
    t.string   "commentable_type", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "friendings", force: :cascade do |t|
    t.integer  "friend_id",   null: false
    t.integer  "friender_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "friendings", ["friend_id", "friender_id"], name: "index_friendings_on_friend_id_and_friender_id", unique: true, using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "likeable_id",   null: false
    t.string   "likeable_type", null: false
  end

  add_index "likes", ["likeable_id", "likeable_type", "user_id"], name: "like_index", unique: true, using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "photo_file_name",    null: false
    t.string   "photo_content_type", null: false
    t.integer  "photo_file_size",    null: false
    t.datetime "photo_updated_at",   null: false
    t.integer  "user_id",            null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "img_url"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "body",              null: false
    t.integer  "author_id",         null: false
    t.integer  "recipient_user_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "college"
    t.string   "hometown"
    t.string   "current_home"
    t.string   "mobile"
    t.text     "summary"
    t.text     "about"
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",               null: false
    t.string   "last_name",                null: false
    t.string   "email",                    null: false
    t.string   "password_digest",          null: false
    t.date     "birthday"
    t.string   "gender"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "auth_token",               null: false
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
    t.string   "cover_photo_file_name"
    t.string   "cover_photo_content_type"
    t.integer  "cover_photo_file_size"
    t.datetime "cover_photo_updated_at"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree

end
