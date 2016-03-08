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

ActiveRecord::Schema.define(version: 20160308144259) do

  create_table "applies", force: :cascade do |t|
    t.integer  "apply_num"
    t.string   "name"
    t.string   "student_id"
    t.string   "major"
    t.string   "email"
    t.string   "phonenumber"
    t.string   "sex"
    t.string   "age"
    t.string   "file"
    t.string   "file2"
    t.string   "etc"
    t.integer  "rated"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.string   "apply_id"
    t.integer  "total"
    t.integer  "num"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "apply_id"
    t.string   "user_name"
    t.integer  "point1"
    t.integer  "point2"
    t.integer  "point3"
    t.integer  "point4"
    t.integer  "point5"
    t.integer  "point6"
    t.integer  "point7"
    t.integer  "point8"
    t.integer  "point9"
    t.integer  "point10"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "pwd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
