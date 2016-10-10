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

ActiveRecord::Schema.define(version: 20161010091911) do

  create_table "accounts", force: :cascade do |t|
    t.string   "subdomain"
    t.string   "resto_name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.boolean  "select_sub_one"
    t.boolean  "select_sub_two"
    t.boolean  "select_sub_three"
    t.boolean  "validate_sub"
    t.boolean  "prevalidate_sub"
    t.boolean  "already_open"
    t.date     "open_on"
    t.boolean  "open_check"
    t.string   "bg_pict_one_file_name"
    t.string   "bg_pict_one_content_type"
    t.integer  "bg_pict_one_file_size"
    t.datetime "bg_pict_one_updated_at"
    t.boolean  "bg_pict_select"
    t.integer  "bg_pict_number"
    t.string   "address"
    t.string   "zipcode"
    t.string   "country"
    t.string   "phone"
    t.string   "fax"
    t.string   "mobile"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "google"
    t.string   "snapchat"
    t.string   "youtube"
    t.string   "vimeo"
    t.string   "city"
    t.string   "email"
    t.time     "mon_am_start"
    t.time     "mon_am_end"
    t.time     "mon_pm_start"
    t.time     "mon_pm_end"
    t.boolean  "mon_am_closed"
    t.boolean  "mon_pm_closed"
    t.time     "tue_am_start"
    t.time     "tue_am_end"
    t.time     "tue_pm_start"
    t.time     "tue_pm_end"
    t.boolean  "tue_am_closed"
    t.boolean  "tue_pm_closed"
    t.time     "wed_am_start"
    t.time     "wed_am_end"
    t.time     "wed_pm_start"
    t.time     "wed_pm_end"
    t.boolean  "wed_am_closed"
    t.boolean  "wed_pm_closed"
    t.time     "thu_am_start"
    t.time     "thu_am_end"
    t.time     "thu_pm_start"
    t.time     "thu_pm_end"
    t.boolean  "thu_am_closed"
    t.boolean  "thu_pm_closed"
    t.time     "fri_am_start"
    t.time     "fri_am_end"
    t.time     "fri_pm_start"
    t.time     "fri_pm_end"
    t.boolean  "fri_am_closed"
    t.boolean  "fri_pm_closed"
    t.time     "sat_am_start"
    t.time     "sat_am_end"
    t.time     "sat_pm_start"
    t.time     "sat_pm_end"
    t.boolean  "sat_am_closed"
    t.boolean  "sat_pm_closed"
    t.time     "sun_am_start"
    t.time     "sun_am_end"
    t.time     "sun_pm_start"
    t.time     "sun_pm_end"
    t.boolean  "sun_am_closed"
    t.boolean  "sun_pm_closed"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "food"
    t.boolean  "drink"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "item_categories", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "price"
    t.boolean  "food"
    t.boolean  "drink"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.boolean  "active"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "food"
    t.boolean  "drink"
    t.integer  "account_id"
  end

  create_table "menu_categories", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "active"
    t.boolean  "food"
    t.boolean  "drink"
    t.integer  "period_quantity"
    t.string   "period"
    t.boolean  "promote"
    t.decimal  "price"
    t.string   "status"
    t.integer  "account_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "first_name"
    t.string   "resto_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
