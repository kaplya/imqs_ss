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

ActiveRecord::Schema.define(:version => 20121018100231) do

  create_table "invent_dimensions", :force => true do |t|
    t.integer  "location_id"
    t.integer  "batch_id"
    t.integer  "color_id"
    t.integer  "size_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "invent_journal_lines", :force => true do |t|
    t.integer  "journal_id"
    t.integer  "item_id"
    t.integer  "dimension_id",                     :null => false
    t.integer  "to_dimension_id"
    t.decimal  "qty",             :default => 0.0, :null => false
    t.string   "type"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "invent_journals", :force => true do |t|
    t.string   "number"
    t.string   "description"
    t.string   "type"
    t.integer  "dimension_id"
    t.integer  "to_dimension_id"
    t.boolean  "posted",          :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "invent_onhands", :force => true do |t|
    t.integer  "item_id",                       :null => false
    t.integer  "dimension_id",                  :null => false
    t.decimal  "ordered_qty",  :default => 0.0, :null => false
    t.decimal  "on_order_qty", :default => 0.0, :null => false
    t.decimal  "physical_qty", :default => 0.0, :null => false
    t.decimal  "posted_qty",   :default => 0.0, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "invent_transactions", :force => true do |t|
    t.integer  "item_id",                         :null => false
    t.integer  "dimension_id",                    :null => false
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "status_receipt"
    t.integer  "status_issue"
    t.decimal  "qty",            :default => 0.0, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "order_lines", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "dimension_id"
    t.decimal  "qty"
    t.decimal  "price"
    t.decimal  "amount"
    t.string   "type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "purch_id"
    t.string   "number"
    t.string   "description"
    t.string   "type"
    t.boolean  "posted",      :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "packing_slip_lines", :force => true do |t|
    t.integer  "slip_id"
    t.integer  "item_id"
    t.integer  "dimension_id"
    t.decimal  "qty"
    t.decimal  "price"
    t.decimal  "amount"
    t.string   "type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "packing_slips", :force => true do |t|
    t.integer  "purch_id"
    t.string   "number"
    t.string   "description"
    t.string   "type"
    t.boolean  "posted",      :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "purch_lines", :force => true do |t|
    t.integer  "purch_id"
    t.integer  "item_id"
    t.integer  "dimension_id"
    t.decimal  "qty"
    t.string   "type"
    t.decimal  "price"
    t.decimal  "amount"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "purches", :force => true do |t|
    t.string   "number"
    t.string   "description"
    t.string   "type"
    t.integer  "dimension_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
