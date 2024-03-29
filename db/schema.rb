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

ActiveRecord::Schema.define(version: 20140529232226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "question_choices", force: true do |t|
    t.integer  "question_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "question_text"
    t.integer  "correct_question_choice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_responses", force: true do |t|
    t.integer  "quiz_id"
    t.integer  "question_id"
    t.integer  "question_choice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_responses", ["quiz_id", "question_id", "question_choice_id"], name: "index_quiz_responses_on_quiz_and_question_and_question_choice", unique: true, using: :btree

  create_table "quizzes", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
