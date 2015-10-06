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

ActiveRecord::Schema.define(version: 20150929201518) do

  create_table "answers", force: :cascade do |t|
    t.text     "post_text",   limit: 10000, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "owner_id"
    t.integer  "question_id"
  end

  add_index "answers", ["owner_id"], name: "index_answers_on_owner_id"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "comments", force: :cascade do |t|
    t.text     "post_text",   limit: 1000, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "owner_id"
    t.integer  "question_id"
  end

  add_index "comments", ["owner_id"], name: "index_comments_on_owner_id"
  add_index "comments", ["question_id"], name: "index_comments_on_question_id"

  create_table "questions", force: :cascade do |t|
    t.string   "name",                     null: false
    t.text     "post_text",  limit: 10000, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "owner_id"
  end

  add_index "questions", ["owner_id"], name: "index_questions_on_owner_id"

  create_table "users", force: :cascade do |t|
    t.string   "display_name",                     null: false
    t.string   "email",                            null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.datetime "deleted_at"
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at"
  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
