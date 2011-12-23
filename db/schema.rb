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

ActiveRecord::Schema.define(:version => 20111213222300) do

  create_table "buildings", :force => true do |t|
    t.string   "address"
    t.string   "city"
    t.integer  "zip"
    t.float    "lat"
    t.float    "lon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "incidents_count",                                                             :default => 0
    t.spatial  "latlon",          :limit => {:srid=>4326, :type=>"point", :geographic=>true}
  end

  add_index "buildings", ["address"], :name => "address"
  add_index "buildings", ["id"], :name => "id", :unique => true

  create_table "incidents", :force => true do |t|
    t.string   "agency"
    t.string   "complaint_type"
    t.string   "descriptor"
    t.date     "created"
    t.date     "closed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "building_address"
  end

  create_table "users", :force => true do |t|
    t.spatial  "location",   :limit => {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
