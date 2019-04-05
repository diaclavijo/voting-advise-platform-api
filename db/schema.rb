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

ActiveRecord::Schema.define(version: 2019_04_05_083237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "vote", null: false
    t.bigint "question_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "political_parties", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "political_party_answers", force: :cascade do |t|
    t.string "vote", null: false
    t.bigint "question_id"
    t.bigint "political_party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["political_party_id"], name: "index_political_party_answers_on_political_party_id"
    t.index ["question_id"], name: "index_political_party_answers_on_question_id"
  end

  create_table "polls", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_polls_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "poll_id"
    t.index ["poll_id"], name: "index_questions_on_poll_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid", null: false
    t.integer "age"
    t.string "email"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "political_party_answers", "political_parties"
  add_foreign_key "political_party_answers", "questions"
  add_foreign_key "questions", "polls"
end
