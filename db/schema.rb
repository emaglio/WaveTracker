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

ActiveRecord::Schema.define(version: 20131128025651) do

  create_table "boards", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spots", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surfers", force: true do |t|
    t.string   "nickname"
    t.string   "home_spot"
    t.string   "goofy_regular"
    t.string   "style"
    t.string   "best_trick"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "myname"
    t.string   "surname"
    t.string   "birth_date"
    t.string   "location"
    t.string   "gender"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_confirm"
    t.integer  "agree"
    t.string   "remember_token"
    t.integer  "remember"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "welcomes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wetsuites", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
