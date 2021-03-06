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

ActiveRecord::Schema.define(:version => 20120301154441) do

  create_table "anypresence_extension_accounts", :force => true do |t|
    t.string   "application_id"
    t.string   "api_host"
    t.string   "api_token"
    t.string   "api_version"
    t.integer  "sign_in_count",              :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "remember_created_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "extension_id"
    t.string   "object_field"
    t.string   "twitter_consumer_key"
    t.string   "twitter_consumer_secret"
    t.string   "twitter_oauth_token"
    t.string   "twitter_oauth_token_secret"
  end

  add_index "anypresence_extension_accounts", ["application_id"], :name => "index_anypresence_extension_accounts_on_application_id", :unique => true
  add_index "anypresence_extension_accounts", ["authentication_token"], :name => "index_anypresence_extension_accounts_on_authentication_token", :unique => true

  create_table "tweet_options", :force => true do |t|
    t.string   "name"
    t.string   "format"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
