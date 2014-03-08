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

ActiveRecord::Schema.define(:version => 20130614014133) do

  create_table "calculators", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.string   "local"
    t.date     "gamedate"
    t.time     "gametime"
    t.boolean  "computed"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "finished"
    t.boolean  "closed"
  end

  create_table "hints", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "team_id"
    t.integer  "goals"
    t.integer  "points"
  end

  create_table "match_results", :force => true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "goals"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "logotipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "abbrev"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.string   "password"
    t.integer  "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "typeof"
  end

end
