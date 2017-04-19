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

ActiveRecord::Schema.define(version: 20170419213528) do

  create_table "grades", force: :cascade do |t|
    t.integer "user_id"
    t.integer "module_course_id"
    t.integer "grade"
  end

  create_table "lecturers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "module_course_id_1"
    t.integer "module_course_id_2"
    t.integer "module_course_id_3"
  end

  create_table "moduleadmins", force: :cascade do |t|
    t.integer "user_id"
    t.integer "module_course_id"
  end

  create_table "modulecourses", force: :cascade do |t|
    t.string  "name"
    t.integer "program_id"
  end

  create_table "programadmins", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string   "name"
    t.datetime "inscription_limit"
  end

  create_table "students", primary_key: "student_number", force: :cascade do |t|
    t.integer "user_id"
    t.integer "module_course_id_1"
    t.integer "module_course_id_2"
    t.integer "module_course_id_3"
    t.integer "module_course_id_4"
    t.integer "module_course_id_5"
  end

  create_table "users", force: :cascade do |t|
    t.string "type_user"
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

end
