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

ActiveRecord::Schema.define(version: 20151214041806) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255, default: "", null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "java_timers", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.datetime "start_at"
    t.boolean  "lock",       limit: 1
    t.boolean  "extended",   limit: 1
    t.boolean  "finished",   limit: 1
  end

  create_table "questionnaire_items", force: :cascade do |t|
    t.string   "item",             limit: 255
    t.boolean  "is_answer",        limit: 1,   default: false
    t.integer  "questionnaire_id", limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "questionnaires", force: :cascade do |t|
    t.text     "question",   limit: 65535
    t.integer  "tag",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "student_number", limit: 255
    t.string   "fullname",       limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "teacher_id",     limit: 4
    t.boolean  "lock",           limit: 1,   default: false
    t.string   "act_ref",        limit: 255
    t.string   "sent_int",       limit: 255
    t.string   "vis_vrb",        limit: 255
    t.string   "seq_glo",        limit: 255
    t.boolean  "will_passed",    limit: 1
    t.integer  "tag_1",          limit: 4
    t.integer  "tag_2",          limit: 4
    t.integer  "tag_3",          limit: 4
    t.integer  "tag_4",          limit: 4
    t.integer  "tag_5",          limit: 4
    t.integer  "tag_6",          limit: 4
    t.integer  "tag_7",          limit: 4
    t.integer  "tag_8",          limit: 4
    t.integer  "tag_9",          limit: 4
    t.integer  "tag_10",         limit: 4
    t.integer  "tag_11",         limit: 4
    t.integer  "tag_12",         limit: 4
    t.integer  "tag_13",         limit: 4
    t.integer  "tag_14",         limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "student_number",         limit: 255, default: "",     null: false
    t.string   "username",               limit: 255, default: "",     null: false
    t.string   "fullname",               limit: 255, default: "",     null: false
    t.string   "gender",                 limit: 255, default: "",     null: false
    t.integer  "age",                    limit: 4
    t.integer  "course",                 limit: 4
    t.integer  "yr_level",               limit: 4
    t.string   "section",                limit: 255
    t.string   "schedule",               limit: 255
    t.float    "prog_1",                 limit: 53
    t.float    "prog_2",                 limit: 53
    t.float    "prog_3",                 limit: 53
    t.string   "email",                  limit: 255, default: "",     null: false
    t.string   "type",                   limit: 255, default: "User", null: false
    t.boolean  "is_passed",              limit: 1
    t.boolean  "passed_java",            limit: 1
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
