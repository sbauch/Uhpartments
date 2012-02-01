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

ActiveRecord::Schema.define(:version => 20120130221411) do

  create_table "buildings", :force => true do |t|
    t.string   "address"
    t.string   "city"
    t.integer  "zip"
    t.float    "lat"
    t.float    "lon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "incidents_count",              :default => 0
    t.integer  "latlon",          :limit => 0
    t.string   "type"
  end

  add_index "buildings", ["address"], :name => "address"
  add_index "buildings", ["id"], :name => "id", :unique => true

  create_table "geometry_columns", :id => false, :force => true do |t|
    t.string  "f_table_catalog",   :limit => 256, :null => false
    t.string  "f_table_schema",    :limit => 256, :null => false
    t.string  "f_table_name",      :limit => 256, :null => false
    t.string  "f_geometry_column", :limit => 256, :null => false
    t.integer "coord_dimension",                  :null => false
    t.integer "srid",                             :null => false
    t.string  "type",              :limit => 30,  :null => false
  end

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

  create_table "laundromats", :force => true do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "lon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spatial_ref_sys", :id => false, :force => true do |t|
    t.integer "srid",                      :null => false
    t.string  "auth_name", :limit => 256
    t.integer "auth_srid"
    t.string  "srtext",    :limit => 2048
    t.string  "proj4text", :limit => 2048
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_customer_token"
  end

  create_table "subways", :force => true do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "lon"
    t.string   "train1"
    t.string   "train2"
    t.string   "train3"
    t.string   "train4"
    t.string   "train5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",   :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "address"
    t.string   "address_alt"
    t.string   "city"
    t.string   "state",                                 :default => "NY"
    t.integer  "zip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
