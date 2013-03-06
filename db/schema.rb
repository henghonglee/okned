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

ActiveRecord::Schema.define(:version => 20130306125735) do

  create_table "fooditems", :id => false, :force => true do |t|
    t.float  "longitude"
    t.float  "latitude"
    t.string "descriptionhtml"
    t.string "source"
    t.string "rating"
    t.string "location"
    t.text   "foodtype"
    t.string "link",            :null => false
    t.string "titlefull"
    t.string "title"
    t.string "subtitle"
    t.text   "description"
    t.text   "images"
  end

  create_table "items", :force => true do |t|
    t.string   "source"
    t.text     "foodtype"
    t.string   "link"
    t.string   "rating"
    t.text     "description"
    t.text     "descriptionHTML"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "titlefull"
    t.string   "subtitle"
    t.text     "images"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "location"
    t.string   "title"
    t.boolean  "is_post",         :default => true
    t.string   "foursqure_venue"
    t.boolean  "flagged",         :default => false
    t.text     "low_res_images"
  end

end
