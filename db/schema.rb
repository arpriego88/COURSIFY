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

ActiveRecord::Schema.define(version: 20150414212451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "complete",    default: false
  end

  create_table "exercises", force: :cascade do |t|
    t.text     "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "video_url"
    t.string   "video_time"
    t.text     "content"
    t.string   "exercise_name"
    t.text     "exercise_content"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "course_id"
    t.boolean  "complete",         default: false, null: false
  end

  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shirt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "purchases", ["shirt_id"], name: "index_purchases_on_shirt_id", using: :btree
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "shirts", force: :cascade do |t|
    t.string   "name"
    t.integer  "height"
    t.integer  "collar"
    t.integer  "weight"
    t.integer  "chest"
    t.integer  "arm"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "subscribes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subscribes", ["course_id"], name: "index_subscribes_on_course_id", using: :btree
  add_index "subscribes", ["user_id"], name: "index_subscribes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "height_ft"
    t.integer  "height_in"
    t.integer  "weight"
    t.integer  "collar"
    t.integer  "chest"
    t.integer  "arm"
    t.boolean  "subscribed",             default: false, null: false
    t.string   "stripeid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "lessons", "courses"
  add_foreign_key "purchases", "shirts"
  add_foreign_key "purchases", "users"
  add_foreign_key "subscribes", "courses"
  add_foreign_key "subscribes", "users"
end
