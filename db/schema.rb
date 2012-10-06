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

ActiveRecord::Schema.define(:version => 20121001184657) do

  create_table "invent_journal_lines", :force => true do |t|
    t.integer  "journal_id"
    t.string   "journal_number"
    t.integer  "item_id"
    t.decimal  "qty",            :default => 0.0, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "invent_journals", :force => true do |t|
    t.string   "number"
    t.string   "description"
    t.integer  "journal_type"
    t.integer  "location_id"
    t.integer  "to_location_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "invent_onhands", :force => true do |t|
    t.string   "item_id"
    t.string   "location_id"
    t.decimal  "ordered_qty",  :default => 0.0, :null => false
    t.decimal  "on_order_qty", :default => 0.0, :null => false
    t.decimal  "physical_qty", :default => 0.0, :null => false
    t.decimal  "posted_qty",   :default => 0.0, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "invent_transactions", :force => true do |t|
    t.string   "item_id"
    t.string   "location_id"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "status_receipt"
    t.integer  "status_issue"
    t.decimal  "qty",            :default => 0.0, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

end
