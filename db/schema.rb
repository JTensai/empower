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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130607231221) do

  create_table "answers", :force => true do |t|
    t.string   "content"
    t.integer  "question_id"
    t.integer  "weight"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "content"
    t.integer  "quiz_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "quiz_results", :force => true do |t|
    t.text     "result"
    t.integer  "quiz_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "quizzes", :force => true do |t|
    t.string   "name"
    t.boolean  "live"
    t.boolean  "scoreable"
    t.boolean  "image_result"
    t.string   "image"
    t.string   "header_url"
    t.string   "ground_rules"
    t.string   "ad_url"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "header_image"
    t.integer  "ad_width"
    t.integer  "ad_height"
    t.string   "fb_text",      :default => "On this Quiz I scored: "
  end

end
