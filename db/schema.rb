# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090624050419) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.text     "detail"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.integer  "role_id"
    t.integer  "received_stars"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sent_stars"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "default_stars"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stars", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
