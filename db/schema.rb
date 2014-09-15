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

ActiveRecord::Schema.define(version: 20140915083201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: true do |t|
    t.string   "name"
    t.float    "amount"
    t.float    "one_year_cost"
    t.float    "one_year_value"
    t.float    "tv"
    t.integer  "grunt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["grunt_id"], name: "index_assets_on_grunt_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name"
    t.integer  "company_users_id"
    t.float    "tv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["company_users_id"], name: "index_companies_on_company_users_id", using: :btree

  create_table "company_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_users", ["company_id"], name: "index_company_users_on_company_id", using: :btree
  add_index "company_users", ["user_id"], name: "index_company_users_on_user_id", using: :btree

  create_table "facilities", force: true do |t|
    t.float    "rent"
    t.float    "tv"
    t.integer  "grunt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facilities", ["grunt_id"], name: "index_facilities_on_grunt_id", using: :btree

  create_table "grunts", force: true do |t|
    t.date     "start_date"
    t.float    "salary"
    t.float    "cash_compensation"
    t.float    "hourly_rate"
    t.float    "ghrr"
    t.float    "commission_rate"
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "title"
    t.boolean  "is_leader"
    t.float    "equity"
    t.float    "total_contributions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grunts", ["company_id"], name: "index_grunts_on_company_id", using: :btree
  add_index "grunts", ["user_id"], name: "index_grunts_on_user_id", using: :btree

  create_table "hours", force: true do |t|
    t.float    "num_hours"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.float    "tv"
    t.integer  "grunt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hours", ["grunt_id"], name: "index_hours_on_grunt_id", using: :btree

  create_table "investments", force: true do |t|
    t.float    "capital"
    t.float    "expenses"
    t.float    "total"
    t.float    "tv"
    t.integer  "grunt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investments", ["grunt_id"], name: "index_investments_on_grunt_id", using: :btree

  create_table "ips", force: true do |t|
    t.float    "num_hours"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.float    "time_tv"
    t.float    "legal_fees"
    t.float    "prototype_costs"
    t.float    "other_costs"
    t.float    "unpaid_royalties"
    t.float    "tv"
    t.integer  "grunt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ips", ["grunt_id"], name: "index_ips_on_grunt_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "company_users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_approved"
    t.string   "auth_code"
  end

  add_index "users", ["company_users_id"], name: "index_users_on_company_users_id", using: :btree

end
