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

ActiveRecord::Schema.define(version: 20160125073850) do

  create_table "characters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "char", null: false
    t.index ["char"], name: "index_characters_on_char", using: :btree
  end

  create_table "three_phrases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "char1_id", null: false
    t.integer "char2_id", null: false
    t.integer "char3_id", null: false
    t.index ["char1_id", "char2_id", "char3_id"], name: "index_three_phrases_on_char1_id_and_char2_id_and_char3_id", unique: true, using: :btree
    t.index ["char1_id"], name: "index_three_phrases_on_char1_id", using: :btree
    t.index ["char2_id"], name: "index_three_phrases_on_char2_id", using: :btree
    t.index ["char3_id"], name: "index_three_phrases_on_char3_id", using: :btree
  end

end