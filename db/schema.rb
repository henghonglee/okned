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

ActiveRecord::Schema.define(:version => 20130605035235) do

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
    t.text     "mid_res_images"
    t.integer  "place_id"
    t.text     "classified"
    t.string   "train"
  end

  create_table "places", :force => true do |t|
    t.float    "current_rating"
    t.string   "title"
    t.string   "subtitle"
    t.string   "description"
    t.text     "images"
    t.text     "foodtype"
    t.string   "foursquare_venue"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "rate_count"
    t.text     "low_res_images"
    t.boolean  "is_visible",       :default => true
  end

  create_table "ratings", :force => true do |t|
    t.integer  "score"
    t.integer  "place_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "fb_access_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
